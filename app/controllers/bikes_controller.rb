class BikesController < ApplicationController
  before_action :setbike, only: [:edit, :update, :destroy]

  def index
    @bike = Bike.new
    @q = Bike.ransack(params[:q])
    @bikes = @q.result(distinct: true)
  end

  def search
    @q = Bike.search(search_params)
    @bikes = @q.result(distinct: true)
  end

  def show
    @bike = Bike.find(params[:id])
    @bike_comment = Comment.new
  end

  def create
    @bike = current_user.bikes.build(bike_params)
    @bike.save!
    redirect_to bikes_path
  end

  def edit
  end

  def update
    @bike.update(bike_params)
    redirect_to bike_path(@bike.id)
  end

  def destroy
    @bike.destroy
    redirect_to bikes_path
  end
  private
  def bike_params
    params.require(:bike).permit(:text,:user_id, :video, bike_images_images: [])
  end
  def setbike
    @bike = current_user.bikes.find(params[:id])
  end
  def search_params
    params.require(:q).permit!
  end
end
