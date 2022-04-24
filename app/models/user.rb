class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_restaurants

  def favorite?(restaurant)
    user_restaurant = UserRestaurant.find_by(user: self, restaurant: restaurant)
    user_restaurant.present? ? true : false
  end
end
