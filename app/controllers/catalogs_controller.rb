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

  def edit
    load_catalog
    @menu = @catalog.menu
  end

  def update
    load_catalog
    if @catalog.update(catalog_params)
      @catalog.menu_items.update_all(link: catalog_url(@catalog), title: @catalog.title)
      redirect_to @catalog
    end

  end

  def destroy
    load_catalog
    @menu = @catalog.menu

    @catalog.destroy

    respond_to do |format|
      format.html { redirect_to menu_url(@menu), notice: 'Catalog was successfully deleted!.'}
      format.json { head :no_content }
    end
  end



  private

    def load_catalog
      @catalog = current_site.catalogs.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:title, :link_title, :slug, :site_id, :menu_id)
    end
end
