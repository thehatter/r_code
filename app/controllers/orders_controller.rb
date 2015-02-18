#encoding: UTF-8
class OrdersController < ApplicationController
before_filter :shop_activate?

  def index
    @orders = current_site.orders.order("created_at DESC").page(params[:page]).per(25)

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
    if authenticate_user!
      @order = current_user.orders.new(order_params)
    else
      @order = Order.new(order_paramssite_id: current_site.id)
    end

    @order.site_id = current_site.id
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        OrderNotifier.information(@order, current_site).deliver
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


  def personal_orders
    @orders = current_user.orders.order("created_at DESC").page(params[:page]).per(25)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

private

  def order_params
    params.require(:order).permit(:name, :address, :email)
  end
end
