module ApplicationHelper
	def current_cart
		current_user.current_cart || current_user.create_new_cart
	end
end
