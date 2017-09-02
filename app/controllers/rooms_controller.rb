class RoomsController < ApplicationController
  before_action :authenticate_admin!, only: ['new', 'destroy', 'update', 'edit']
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

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room
    else
      render 'edit'
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
