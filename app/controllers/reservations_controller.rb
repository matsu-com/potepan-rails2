class ReservationsController < ApplicationController
  before_action :set_item_search_query
  def index
    @reservations = Reservation.all
  end

  def new
    # @reservation = Reservation.find(params[:id])
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @reservations = Reservation.new(reservation_params)
    # binding.pry
    @user = current_user
    if @reservations.save
      redirect_to "/users/:id/reserved_room"
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservations.save
      redirect_to "/"
    end
  end

  private
  def reservation_params
    params.permit(:start_day, :end_day, :person, :cost, :room_id, :user_id)
  end
end
