class UsersController < ApplicationController
  before_action :colect_user, only: [:edit, :update]

  def index
  end

  def show
    @user = User.find(params[:id])
    @bike = Bike.new
    @bikes = @user.bikes
    @favorites = @user.favorites
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  private
  def user_params
      params.require(:user).permit(:name, :profile_image)
  end
  def colect_user
   @user = User.find(params[:id])
     if @user.id != current_user.id
        redirect_to bikes_path(current_user)
     end
  end
end
