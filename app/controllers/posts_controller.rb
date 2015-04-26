class PostsController < ApplicationController

  before_filter :correct_user, :only => [:create, :edit , :update, :destroy]


  def show
    load_post
  end

  def new
    @post = Post.new
    @blog = Blog.find(params[:blog_id])
  end

  def create

    @post = Post.new(post_params)
    @blog = @post.blog
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to "/blog", notice: 'Пост успешно создан!' }
      else
        format.html { render action: 'new', :blog_id => @blog.id }
      end
    end
  end

  def destroy
    load_post
    @blog = Blog.find(@post.blog_id)

    @blog.destroy

    respond_to do |format|
      format.html { redirect_to "/blog", notice: 'Post was successfully deleted!.'}
      format.json { head :no_content }
    end
  end

  private

    def load_post
      @post = current_site.blogs.first.posts.friendly.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :slug, :blog_id, :body, :post_img, 
                                   :post_img_cache, :remove_post_img ,:summary)
    end

end
