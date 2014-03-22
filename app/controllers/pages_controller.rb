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
    @menu = Menu.find(params[:menu_id])

  end

  def edit
    load_page
    @menu = Menu.find(@page.menu_id)
  end


  def create
    @page = current_site.pages.new(page_params)
    @menu = Menu.find(params[:page][:menu_id])
    respond_to do |format|
      if @page.save
        @menu_item = MenuItem.create(link: page_url(@page), page_id: @page.id, menu_id: @page.menu_id, title: @page.title)
        format.html { redirect_to page_url(@page), notice: 'Page was successfully created.' }
      else
        format.html { render action: 'new', :menu_id => @menu.id, notice: 'Страница не создана!' }
      end
    end
  end

  def update
    load_page
    if @page.update(page_params)
      @page.menu_items.update_all(link: page_url(@page), title: @page.title)
      redirect_to @page
    end

  end


  def destroy
    load_page
    @menu = @page.menu

    @redirect_url = params[:redirectto]

    @page.destroy

    respond_to do |format|
      if @redirect_url == "1"
        format.html { redirect_to current_url.to_s, notice: 'Page was successfully deleted!'}
      else
        format.html { redirect_to menu_url(@menu), notice: "Page was successfully deleted! #{@redirect_url}"}
      end
    end
  end

  def front
    @page = Page.find(current_site.front_page_id)
    render :show
  end





  private

    def load_menu_items
      @items = current_site.menu_items
    end

    def load_page
      # @page ||= current_site.pages.find_by_slug!(params[:id])
      @page = current_site.pages.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :site_id, :menu_id, :slug, :redirectto)
    end
 
end
