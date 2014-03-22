class CategoriesController < ApplicationController



  def show 
    load_category
  end

  def new
    @category = Category.new
    @catalog = Catalog.find(params[:catalog_id])
  end


  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to menu_url(@category.catalog.menu), notice: 'Category was successfully created.' }
      else
        flash[:error] = "there was a problem"
      end
    end
  end

  def edit
    load_category
  end

  def update
    load_category
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to menu_url(@category.catalog.menu), notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    load_category
    @menu = @category.catalog.menu
    @redirect_url = params[:redirectto]

    @category.destroy

    respond_to do |format|
      if @redirect_url == "1"
        format.html { redirect_to current_url.to_s, notice: 'Category was successfully deleted!'}
      else
        format.html { redirect_to menu_url(@menu), notice: 'Category was successfully deleted!'}
      end
    end
  end
  

  def sort
    params[:category].each_with_index do |id, index|
      Category.where(id: id).update_all(weight: index+1)
    end
    render nothing: true
  end

  private

    def load_category
      @category = Category.friendly.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :catalog_id, :weight, :slug, :category_img, :category_img_cache)
    end


end
