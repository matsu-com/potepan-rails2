class UsersController < ApplicationController
  before_action :set_item_search_query
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def reserved_room
    @users = User.find_by(id: current_user.id)
    @rooms = Room.find_by(user_id: current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile)
  end
end
