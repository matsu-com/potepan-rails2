class HomesController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
  end
end
