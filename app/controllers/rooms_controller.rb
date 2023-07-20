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

  def create_params
    params.require(:room).permit(:name, :is_private)
  end
end
