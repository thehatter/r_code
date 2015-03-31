#encoding: UTF-8
class LineItemsController < ApplicationController
before_action :shop_activate?, only: [:create]

	def create
		@cart = current_cart
		catalog_item = CatalogItem.friendly.find(params[:catalog_item_id])
		@line_item = @cart.add_catalog_item(catalog_item.id, catalog_item.site.currency)

	  respond_to do |format|
	    if @line_item.save
	    	format.html { redirect_to @line_item.cart }
        format.js
	    	format.json { render json: @line_item,
	    			status: :created, location: @line_item }
	    else
	    	format.html { render action: "new" }
	    	format.json { render json: @line_item.errors,
	    			status: :unprocessable_entity }
	    end
  	end
	end

private

  def line_item_params
    params.require(:line_item).permit(:catalog_item_id, :cart_id, :catalog_item)
  end
end
