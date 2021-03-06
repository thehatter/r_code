# config valid only for Capistrano 3.1
# lock '3.1.0'

set :application, 'r_code'
# set :repo_url, 'git@example.com:me/my_repo.git'

set :repo_url, 'git@github.com:thehatter/r_code.git'
set :application, 'r_code'
application = 'r_code'


set :linked_files, %w{config/database.yml} #comment on setup
set :linked_dirs, %w{public/uploads} #uploads dir
set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}# mb comment on setup

set :rvm_type, :user
set :rvm_ruby_version, '2.2.0'

set :deploy_to, '/var/www/apps/r_code'


namespace :foreman do
  desc 'Start server'
  task :start do
    on roles(:all) do
      sudo "start #{application}"
    end
  end

  desc 'Stop server'
  task :stop do
    on roles(:all) do
      sudo "stop #{application}"
    end
  end

  desc 'Restart server'
  task :restart do
    on roles(:all) do
      sudo "restart #{application}"
    end
  end

  desc 'Server status'
  task :status do
    on roles(:all) do
      execute "initctl list | grep #{application}"
    end
  end
end

namespace :git do
  desc 'Deploy'
  task :deploy do
    ask(:message, "Commit message?")
    run_locally do
      execute "git add -A"
      execute "git commit -m '#{fetch(:message)}'"
      execute "git push"
    end
  end
end

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5



namespace :deploy do

  # namespace :assets do
  #   desc 'Run the precompile task locally and rsync with shared'
  #   task :precompile do
  #     on roles(:web) do
  #       %x{bundle exec rake assets:precompile}
  #       %x{rsync --recursive --times --rsh=ssh --compress --human-readable --progress public/assets #{user}@#{host}:#{shared_path}}
  #       %x{bundle exec rake assets:clean}
  #     end
  #   end
  # end

  # namespace :assets do
  #   task :precompile do
  #     on roles(:web) do
  #       from = source.next_revision(current_revision)
  #       if capture("cd #{current_path} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
  #         run_locally("rake assets:clean && rake assets:precompile")
  #         run_locally "cd public && tar -jcf assets.tar.bz2 assets"
  #         top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
  #         run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
  #         run_locally "rm public/assets.tar.bz2"
  #         run_locally("rake assets:clean")
  #       else
  #         logger.info "Skipping asset precompilation because there were no asset changes"
  #       end
  #     end
  #   end

  #   task :symlink do 
  #     on roles(:web) do
  #       run ("rm -rf #{current_path}/public/assets &&
  #             mkdir -p #{current_path}/public &&
  #             mkdir -p #{shared_path}/assets &&
  #             ln -s #{shared_path}/assets #{current_path}/public/assets")
  #     end
  #   end
  # end

  desc 'Setup'
  task :setup do
    on roles(:all) do
      execute "mkdir  #{shared_path}/config/"
      execute "mkdir  /var/www/apps/#{application}/run/"
      execute "mkdir  /var/www/apps/#{application}/log/"
      execute "mkdir  /var/www/apps/#{application}/socket/"
      execute "mkdir #{shared_path}/system"
      # execute "mkdir /var/www/log" #make???????????
      sudo "ln -s /var/log/upstart /var/www/log/upstart"

      upload!('shared/database.yml', "#{shared_path}/config/database.yml")
      
      upload!('shared/Procfile', "#{shared_path}/Procfile")


      upload!('shared/nginx.conf', "#{shared_path}/nginx.conf")
      sudo 'service nginx stop'
      #must create mkdir /usr/local/nginx/conf/
      sudo "rm -f /usr/local/nginx/conf/nginx.conf"
      sudo "ln -s #{shared_path}/nginx.conf /usr/local/nginx/conf/nginx.conf"
      sudo 'service nginx start -c /usr/local/nginx/conf/nginx.conf'

    end
  end

  desc 'Create_db'
  task :create_db do
    on roles(:all) do

      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:create"
        end
      end

    end
  end

  desc 'Create symlink'
  task :symlink do
    on roles(:all) do
      execute "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      execute "ln -s #{shared_path}/Procfile #{release_path}/Procfile"
      execute "ln -s #{shared_path}/system #{release_path}/public/system"
    end
  end

  desc 'Foreman init'
  task :foreman_init do
    on roles(:all) do
      foreman_temp = "/var/www/tmp/foreman"
      execute  "mkdir -p #{foreman_temp}"
      # Создаем папку current для того, чтобы foreman создавал upstart файлы с правильными путями
      execute "ln -s #{release_path} #{current_path}"

      within current_path do
        execute "cd #{current_path}"
        execute :bundle, "exec foreman export upstart #{foreman_temp} -a #{application} -u deployer -l /var/www/apps/#{application}/log -d #{current_path}"
      end
      sudo "mv #{foreman_temp}/* /etc/init/"
      sudo "rm -r #{foreman_temp}"
    end
  end

  # desc "compiles assets locally"
  # task :compile_assets_locally do
  #   run_locally do
  #     execute "RAILS_ENV=#{fetch(:rails_env)} bundle exec rake assets:precompile"
  #   end
  # end


  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      sudo "restart #{application}"
    end
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'

  # after :updating, 'deploy:symlink'

  after :setup, 'deploy:symlink'
  after :setup, 'deploy:create_db'
  after :setup, 'deploy:foreman_init'

  after :foreman_init, 'foreman:start'

  before :foreman_init, 'rvm:hook'

  before :setup, 'deploy:starting'
  before :setup, 'deploy:updating'
  before :setup, 'bundler:install'

  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'


  # desc 'copy ckeditor nondigest assets'
  # task :copy_nondigest_assets do
  #   on roles(:app) do
  #     run "cd #{release_path} && #{rake} RAILS_ENV=#{rails_env} ckeditor:create_nondigest_assets"
  #   end
  # end

  # after 'deploy:compile_assets_locally', 'copy_nondigest_assets'


  

  # before "deploy:assets:precompile", "deploy:post_symlink"

  # before :deploy, 'deploy:assets:symlink'
  # before :deploy, 'deploy:assets:precompile'

  # after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  # before :deploy, 'git:deploy'



  # after :publishing, :restart

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end




end