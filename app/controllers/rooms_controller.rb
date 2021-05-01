class RoomsController < ApplicationController
  before_action :set_q, only: [:home, :search]
  before_action :set_item_search_query

  def home
    @rooms = Room.all

  end

  # def keyword
  #   @rooms = Room.keyword_search(params[:search])
  # end

  def index
    @rooms = Room.all
    # @search = Room.search(params[:q])
    # @rooms = @search.result
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
    @room.user_id = current_user.id
    if@room.save
      flash[:notice] = "新規作成しました。"
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render "edit"
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end

  def search
    @serarch = Room.ransack(params[:q])
    @results = @q.result
    # @rooms = @search.result
  end

  # def search
  #   @room = Room.search(params[:search])
  # end

  # def search
  #   if params[:place].present?
  #     @rooms = Room.where('name LIKE ?', "%#{params[:place]}%")
  #   else
  #     @rooms = Room.none
  #   end
  # end

  private
  def room_params
    params.require(:room).permit(:title, :body, :image, :place, :cost)
  end

  def set_q
    @q = Room.ransack(params[:q])
    # @rooms = @q.results(distinct: true)
  end
end
