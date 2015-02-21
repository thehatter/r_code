class MenusController < ApplicationController
   before_filter :authenticate_user!, only: [:show,:new, :edit, :update, :destroy]
   before_filter :correct_user, :only => [:show, :destroy, :edit , :update]

  def show
    load_menu
  end

  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
    load_menu
  end

  def update
    load_menu
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to current_url, notice: 'Меню успешно обновлено' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def load_menu
      @menu = current_site.menus.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:title, :site_id, :region_id, :show_on_front)
    end



end