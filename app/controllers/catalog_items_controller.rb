class CatalogItemsController < ApplicationController

  def show
    load_catalog_item
  end

  def new
    @catalog_item = CatalogItem.new
    @category = Category.find(params[:category_id])
  end


  def create
    @catalog_item = current_site.catalog_items.new(catalog_item_params)
    @category = Category.find(params[:catalog_item][:category_id])
    respond_to do |format|
      if @catalog_item.save
        format.html { redirect_to catalog_item_url(@catalog_item), notice: 'Catalog item was successfully created.' }
      else
        format.html { render action: 'new', :category_id => @category.id }
      end
    end
  end

  def edit
    load_catalog_item
  end

  def update
    load_catalog_item
    respond_to do |format|
      if @catalog_item.update(catalog_item_params)
        format.html { redirect_to @catalog_item, notice: 'Catalog item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    load_catalog_item

    @catalog_item.destroy

    respond_to do |format|
      format.html { redirect_to current_url.to_s, notice: 'Catalog item was successfully deleted!'}
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
      @catalog_item = CatalogItem.friendly.find(params[:id])
    end

    def catalog_item_params
      params.require(:catalog_item).permit(:title, :category_id, :site_id, :weight, :slug, :body, :catalog_item_img, :catalog_item_img_cache, :price)
    end

end
