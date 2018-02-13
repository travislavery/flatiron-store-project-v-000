class StoreController < ApplicationController
	def index
		@items = Item.all.select do |item|
			item.inventory > 0
		end
		@categories = Category.all
	end
end
