class EventsController < ApplicationController
  def index
    @pictures = Picture.where(attachable_type: 'Event')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new

    if @event.save
      if params[:images]
        params[:images].each { |image|
          @event.pictures.create(image: image)
        }
      end
      redirect_to events_path
    end
  end

  def delete
    @pictures = Picture.where(attachable_type: 'Event')
  end

  def destroy_pictures
    @pictures = Picture.where(id: params[:pictures_ids])
    @pictures.each do |picture|
      picture.destroy
    end

    redirect_to events_path
  end
end
