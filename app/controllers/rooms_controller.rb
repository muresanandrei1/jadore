class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def new
  end

  def create
    @room = Room.new(room_params)
    if @room.save

      if params[:images]
        params[:images].each { |image|
          @room.pictures.create(image: image)
        }
      end
      redirect_to @room
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to new_room_path
  end

  private
    def room_params
      params.require(:room).permit(:title, :price, :images, :description, :facilities)
    end
end
