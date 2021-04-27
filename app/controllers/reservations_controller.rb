class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    # @reservation = Reservation.find(params[:id])
    @room = Room.find(params[:id])
    @reservations = Reservations.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user.id
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
    params.require(:reservation).permit(:start_day, :end_day, :person, :cost, :room_id, :user_id)
  end
end
