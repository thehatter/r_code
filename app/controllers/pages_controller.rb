class PagesController < ApplicationController
  # before_filter :load_page, :on => [:show]

  def index
    @pages = Page.all
  end

  def show 
    load_page
  end

  def new
    @page = Page.new
  end

  def edit

  end

  def create
    @page = current_site.pages.new(page_params)
    respond_to do |format|
      if @page.save
        format.html { redirect_to page_url(@page), notice: 'Page was successfully created.' }
      else
        flash[:error] = "there was a problem"
      end
    end
  end

  def front
    @page = Page.find(current_site.front_page_id)
    render :show
  end



  private

    def load_page
      @page = current_site.pages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :site_id)
    end
 
end
