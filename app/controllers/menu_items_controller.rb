class MenuItemsController < ApplicationController
  before_filter :correct_user, :only => [:destroy, :sort]


  def sort
    params[:menu_item].each_with_index do |id, index|
      # MenuItem.where(weight: index).update_all(weight:index+1)
      MenuItem.where(id: id).update_all(weight: index+1)
    end

    render nothing: true

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
    # # Never trust parameters from the scary internet, only allow the white list through.
    # def catalog_params
    #   params.require(:catalog).permit(:title, :link_title, :slug, :site_id, :menu_id)
    # end
end
