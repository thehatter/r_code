class CatalogsController < ApplicationController


  def index
    @catalogs = Catalog.all
  end

  def show 
    load_catalog
  end

  def new
    @catalog = Catalog.new
    @menu = Menu.find(params[:menu_id])
  end

  def create
    @catalog = current_site.catalogs.new(catalog_params)
    respond_to do |format|
      if @catalog.save
        @menu_item = MenuItem.create(link: catalog_url(@catalog), catalog_id: @catalog.id, menu_id: @catalog.menu_id, title: @catalog.title)
        format.html { redirect_to catalog_url(@catalog), notice: 'Catalog was successfully created.' }
      else
        flash[:error] = "there was a problem"
      end
    end
  end


  private

    def load_catalog
      @catalog = current_site.catalogs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:title, :link_title, :slug, :site_id, :menu_id)
    end
end
