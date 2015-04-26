class MenuItemsController < ApplicationController
  before_filter :correct_user, :only => [:destroy, :sort, :create, :edit, :update]


  def sort
    params[:menu_item].each_with_index do |id, index|
      # MenuItem.where(weight: index).update_all(weight:index+1)
      MenuItem.where(id: id).update_all(weight: index+1)
    end

    render nothing: true
  end


  def new
    @menu_item = MenuItem.new
    @menu = Menu.find(params[:menu_id])
  end


  def create
    @menu = Menu.find(params[:menu_item][:menu_id])
    @menu_item = @menu.menu_items.new(menu_item_params)
    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to current_url, notice: 'Ссылка успешно создана.' }
      else
        format.html { render action: 'new', :menu_id => @menu.id, notice: 'Ссылка не создана!' }
      end
    end
  end


  def edit
    load_item
    # @menu = Menu.find(@page.menu_id)
  end

  def update
    load_item
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to current_url, notice: 'Ссылка успешно создана.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    load_item
    @menu = @menu_item.menu

    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to menu_url(@menu), notice: 'Catalog item was successfully deleted!.'}
      format.json { head :no_content }
    end
  end


  private


    def load_item
      @menu_item = MenuItem.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params.require(:menu_item).permit(:title, :link_title, :slug, :site_id, :menu_id, :catalog_id, :link, :weight)
    end
end
