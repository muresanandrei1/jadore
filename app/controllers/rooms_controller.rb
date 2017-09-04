class RoomsController < ApplicationController
  before_action :authenticate_admin!, only: ['new', 'destroy', 'update', 'edit']
  def show
    @room = Room.find(params[:id])
    @random_rooms = Room.order("RANDOM()").limit(2)
  end

  def new
    @room = Room.new
  end

  def index
    @room = Room.all
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
      if params[:images]
        params[:images].each { |image|
          @room.pictures.create(image: image)
        }
      end
      redirect_to @room
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private
    def room_params
      params.require(:room).permit(:title, :price, :images, :description, :facilities)
    end
end
