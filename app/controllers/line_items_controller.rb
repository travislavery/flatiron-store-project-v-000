class LineItemsController < ApplicationController

	def create
		@cart = current_cart
		line_item = @cart.add_item(params[:item_id])
		line_item.save
		redirect_to cart_path(@cart)
	end
end
