#encoding: UTF-8
class CartsController < ApplicationController
before_action :shop_activate?, only: :show

	def show
		@cart = Cart.find(params[:id])
	end

	def destroy
		@cart = current_cart
		@cart.destroy
		session[:cart_id] = nil
		respond_to do |format|
			format.html { redirect_to root_path,
			 		notice: 'Корзина пуста' }
			format.json { head :ok }
		end
	end

end
