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
        format.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
      else
        flash[:error] = "there was a problem"
      end
    end
  end

  private

    def load_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :catalog_id, :weight, :slug)
    end


end
