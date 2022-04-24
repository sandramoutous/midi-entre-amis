class UserRestaurantsController < ApplicationController
  before_action :set_user_restaurant, only: %i[edit update destroy]
  def index
    @user_restaurants = UserRestaurant.all
  end

  def new
    @restaurant = Restaurant.find(params.fetch(:restaurant_id))
    @user_restaurant = UserRestaurant.new
  end

  def create
    @user_restaurant = UserRestaurant.new(user_restaurant_params)
    if @user_restaurant.save
      redirect_to wishlist_user_path(current_user), notice: 'Le restaurant a bien été enregistré dans la wishlist'
    else
      render :new
    end
  end

  def edit
    @restaurant = @user_restaurant.restaurant
  end

  def update
    if @user_restaurant.update(user_restaurant_params)
      redirect_to wishlist_user_path(current_user), notice: 'La wishlist a bien été mise à jour'
    else
      render :edit
    end
  end

  def destroy
    redirect_to wishlist_user_path(current_user), notice: 'Le restaurant a bien été retiré de la wishlist' if @user_restaurant.destroy
  end

  private

  def set_user_restaurant
    @user_restaurant = UserRestaurant.find(params[:id])
  end

  def user_restaurant_params
    params.require(:user_restaurant).permit(:user_id, :restaurant_id, :comment)
  end
end