class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_item_search_query
  def set_item_search_query
    @q = Room.ransack(params[:q])
    @room = @q.result(distinct: true)
  end

  def application
    @users = User.all
    @rooms = Rooms.all
  end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
