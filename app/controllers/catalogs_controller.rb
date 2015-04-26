# encoding: utf-8
class CatalogsController < ApplicationController
  before_filter :correct_user, :only => [:destroy, :edit , :update, :sort]

  def index
    @catalogs = Catalog.all
  end

  def show
    load_catalog
  end

  def new
    @catalog = Catalog.new
    @menu = Menu.find(params[:menu_id])
    @onelevel_nest = params[:onelevel_nest] # 1 level catalog!
  end

  def create
    @catalog = current_site.catalogs.new(catalog_params)
    @menu = Menu.find(params[:catalog][:menu_id])
    respond_to do |format|
      if @catalog.save
        @menu_item = MenuItem.create(link: catalog_path(@catalog), catalog_id: @catalog.id, menu_id: @catalog.menu_id, title: @catalog.title)
        format.html { redirect_to current_url, notice: 'Catalog was successfully created.' }
      else
        format.html { render action: 'new', :menu_id => @menu.id }
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
      @catalog.menu_items.update_all(link: catalog_path(@catalog), title: @catalog.title)
      redirect_to current_url
    end

  end

  def destroy
    load_catalog
    @menu = @catalog.menu

    @catalog.destroy

    respond_to do |format|
      format.html { redirect_to current_url, notice: 'Catalog was successfully deleted!.'}
      format.json { head :no_content }
    end
  end

  def sort
    params[:catalog].each_with_index do |id, index|
      Catalog.where(id: id).update_all(weight: index+1)
    end
    render nothing: true
  end

  private

    def load_catalog
      @catalog = current_site.catalogs.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:title, :link_title, :slug, :site_id, :menu_id, 
        :onelevel_nest, :weight)
    end

end
