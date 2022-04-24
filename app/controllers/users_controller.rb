class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy wishlist]

  def show; end

  def destroy
    redirect_to root_path, notice: "L'utilisateur a bien été supprimé" if @user.destroy
  end

  def wishlist
    @user_restaurants = current_user.user_restaurants
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
