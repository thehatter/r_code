class BlogsController < ApplicationController
  before_filter :correct_user, :only => [:create, :edit , :update, :destroy]


  def show
    @blog = current_site.blogs.first
    @posts = @blog.posts.all.order("created_at DESC")
  end

  def new
    @blog = Blog.new
    @menu = Menu.find(params[:menu_id])
  end

  def create
    @blog = current_site.blogs.new(blog_params)
    @menu = Menu.find(params[:blog][:menu_id])
    respond_to do |format|
      if @blog.save
        @menu_item = MenuItem.create(link: "/blog", blog_id: @blog.id, menu_id: @blog.menu_id, title: @blog.title)
        format.html { redirect_to current_url, notice: 'Блог успешно создан!' }
      else
        format.html { render action: 'new', :menu_id => @menu.id }
      end
    end
  end


  def edit
    load_blog
    @menu = @blog.menu
  end

  def update
    load_blog
    if @blog.update(blog_params)
      @blog.menu_items.update_all(title: @blog.title)
      redirect_to "/blog"
    end

  end



  def destroy
    load_blog
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to current_url, notice: 'Блог успешно обновлен!'}
      format.json { head :no_content }
    end
  end


  private

    def load_blog
      @blog = current_site.blogs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :slug, :site_id, :menu_id)
    end

end
