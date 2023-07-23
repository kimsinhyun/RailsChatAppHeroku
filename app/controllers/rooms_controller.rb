class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_expect(current_user)
  end

  def create
    @room = Room.create!(create_params)
  end

  def show
    @single_room = Room.find(params[:id])

    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc).includes(:user)

    @users = User.all_expect(current_user)
    render 'rooms/index'
  end

  def create_params
    params.require(:room).permit(:name, :is_private)
  end
end
