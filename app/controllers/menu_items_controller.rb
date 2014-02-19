class MenuItemsController < ApplicationController

  def sort
    params[:menu_item].each_with_index do |id, index|
      # MenuItem.where(weight: index).update_all(weight:index+1)
      MenuItem.where(id: id).update_all(weight: index+1)
    end

    render nothing: true

  end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def catalog_params
    #   params.require(:catalog).permit(:title, :link_title, :slug, :site_id, :menu_id)
    # end
end
