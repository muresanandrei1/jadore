class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def new
  end

  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to @room
  end

  private
    def room_params
      params.require(:room).permit(:title, :price, :photo)
    end
end
