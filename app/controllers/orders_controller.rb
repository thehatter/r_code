#encoding: UTF-8
class OrdersController < ApplicationController
	def index
		@orders = Order.order("created_at DESC").page(params[:page]).per(25)

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @orders }
		end
	end

	def new
		@cart = current_cart
		if @cart.line_items.empty?
			redirect_to root_url, notice: "Корзина пуста"
			return
		end

		@order = Order.new
		respond_to do |format|
			format.html #new.html.slim
			format.json { render json: @order}
		end
	end

	def create
		@order = Order.new(order_params)
		@order.add_line_items_from_cart(current_cart)

		respond_to do |format|
			if @order.save
				Cart.destroy(session[:cart_id])
				session[:cart_id] = nil
				OrderNotifier.received(@order).deliver
				format.html { redirect_to root_url,
						notice: 'Спасибо за Ваш заказ' }
				format.json { render json: @order, status: :created, location: @order }
			else
				@cart = current_cart
				format.html { render action: "new" }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
	end

private

  def order_params
    params.require(:order).permit(:name, :address, :email)
  end
end
