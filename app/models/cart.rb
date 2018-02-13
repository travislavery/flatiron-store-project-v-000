class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		total = 0
		self.items.each do |item|
			line = LineItem.find_by(cart: self, item_id: item.id)
			total += item.price * line.quantity
		end
		total
	end

	def add_item(item_id)
		line = LineItem.find_by(cart: self, item_id: item_id)
		if line
			line.quantity += 1
			line
		else
			LineItem.new(cart: self, item_id: item_id)
		end
	end

	def checkout
		self.status = "submitted"
		self.items.each do |item|
			item.inventory -= LineItem.find_by(cart_id: self.id, item_id: item.id).quantity
			item.save
		end
		self.save
	end
end
