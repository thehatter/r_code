#encoding: UTF-8
class LineItemsController < ApplicationController

	def index
	end

	def new
	end

	def create
		@cart = current_cart
		catalog_item = CatalogItem.friendly.find(params[:catalog_item_id])
		@line_item = @cart.add_catalog_item(catalog_item.id, catalog_item.currency)

	  respond_to do |format|
	    if @line_item.save
	    	format.html { redirect_to @line_item.cart }

	    	format.json { render json: @line_item,
	    			status: :created, location: @line_item }
	    else
	    	format.html { render action: "new" }
	    	format.json { render json: @line_item.errors,
	    			status: :unprocessable_entity }
	    end
  	end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

private

  def line_item_params
    params.require(:line_item).permit(:catalog_item_id, :cart_id, :catalog_item)
  end
end
