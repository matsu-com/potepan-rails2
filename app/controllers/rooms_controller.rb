class RoomsController < ApplicationController
  def home
    @rooms = Room.all
  end

  def keyword
    @rooms = Room.keyword_search(params[:search])
  end

  def index
    @rooms = Room.all
    # @rooms = Room.search(params[:search])
  end

  def show
    @rooms = Room.search(params[:search])
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.user_id = current_user.id
      @room.save
      redirect_to room_path(@room)
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end

  # def search
  #   @room = Room.search(params[:search])
  # end
  def search
    if params[:place].present?
      @rooms = Room.where('name LIKE ?', "%#{params[:place]}%")
    else
      @rooms = Room.none
    end
  end

  private
  def room_params
    params.require(:room).permit(:title, :body, :image, :place, :cost)
  end
end
