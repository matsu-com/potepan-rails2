class HomesController < ApplicationController
  before_action :set_item_search_query
  def index
    @users = User.all
    @rooms = Room.all
  end
end
