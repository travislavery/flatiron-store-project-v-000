class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  def create_new_cart
  	cart = Cart.create(user: self)
  	self.current_cart_id = cart.id
  	self.save
  	cart
  end

end
