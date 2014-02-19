class CatalogItemsController < ApplicationController

  def show 
    load_catalog_item
  end

  def new
    @catalog_item = CatalogItem.new
    @category = Category.find(params[:category_id])
  end


  def create
    @catalog_item = CatalogItem.new(catalog_item_params)
    respond_to do |format|
      if @catalog_item.save
        format.html { redirect_to catalog_item_url(@catalog_item), notice: 'Catalog item was successfully created.' }
      else
        flash[:error] = "there was a problem"
      end
    end
  end

  def sort
    params[:catalog_item].each_with_index do |id, index|
      CatalogItem.where(id: id).update_all(weight: index+1)
    end
    render nothing: true
  end

  private

    def load_catalog_item
      @catalog_item = CatalogItem.find(params[:id])
    end

    def catalog_item_params
      params.require(:catalog_item).permit(:title, :category_id, :weight, :slug)
    end

end
