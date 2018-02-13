class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_cart
  	#binding.pry
	if current_user.current_cart != nil
	  current_user.current_cart 
	else
	  current_user.create_new_cart
	end
  end
end
