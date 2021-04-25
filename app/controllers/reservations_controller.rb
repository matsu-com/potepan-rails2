class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    # @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user.id
  end

  def update
    @reservation = Reservation.find(params[:id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_day, :end_day, :person, :cost, :room_id, :user_id)
  end
end
