class MenusController < ApplicationController
  

  def show
    load_menu
  end

  private

    def load_menu
      @menu = current_site.menus.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:menu).permit(:title, :site_id, :block_id)
    end



end