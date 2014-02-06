class PagesController < ApplicationController
  # before_filter :load_page, :on => [:show]

  def index
    @pages = Page.all
  end

  def show 
    load_page
    load_menus
  end

  def new
    @page = Page.new
    @menu = Menu.find(params[:menu_id])
  end

  def edit
    load_page
    @menu = Menu.find(@page.menu_id)
  end

  def update
    load_page
    if @page.update(page_params)
      redirect_to @page
    end

  end



  def create
    @page = current_site.pages.new(page_params)
    
    respond_to do |format|
      if @page.save
        @menu_item = MenuItem.create(link: page_url(@page), page_id: @page.id, menu_id: @page.menu_id, title: @page.title)
        format.html { redirect_to page_url(@page), notice: 'Page was successfully created.' }
      else
        flash[:error] = "there was a problem"
      end
    end
  end

  def front
    @page = Page.find(current_site.front_page_id)
    load_menus
    render :show
  end



  private

    def load_menu_items
      @items = current_site.menu_items
    end

    def load_menus
      @menus = current_site.menus
    end

    def load_page
      # @page ||= current_site.pages.find_by_slug!(params[:id])
      @page = current_site.pages.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :site_id, :menu_id, :slug)
    end
 
end
