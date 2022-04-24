class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: :show

  def index
    @params = search_params
    @restaurants = Restaurant.all
  end

  def show; end

  def search
    @params = search_params
    @restaurants = Restaurant.search(@params)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :category_id, :cuisine_id)
  end

  def search_params
    return {} unless params.key? :search

    params.require(:search).permit(
      :category_id,
      cuisine_ids: [],
    )
  end
end
