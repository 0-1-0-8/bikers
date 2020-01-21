class FavoritesController < ApplicationController
	 before_action :set_favorites

  def favorite
    favorite = current_user.favorites.new(bike_id: @bike.id)
    favorite.save
  end

  def unfavorite
    favorite = current_user.favorites.find_by(bike_id: @bike.id)
    favorite.destroy
  end

  private

  def set_favorites
    @bike = Bike.find(params[:bike_id])
    @id_name = "#favorite-link-#{@bike.id}"
  end
end
