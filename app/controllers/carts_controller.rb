class CartsController < ApplicationController
	before_filter :authenticate_user!
	def create

	end

	def update
		@cart = Cart.find(params[:id])
	end

	def show
		@cart = Cart.find(params[:id])
		@user = current_user
	end

	def checkout
		
		@cart = current_cart
		@cart.checkout
		current_user.current_cart = nil
		current_user.save
		binding.pry
		
		redirect_to @cart
	end

	private

	def cart_params
		params.require(:cart).permit(:user, item_ids: [])
	end
end
