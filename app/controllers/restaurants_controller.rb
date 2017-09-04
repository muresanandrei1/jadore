class RestaurantsController < ApplicationController
  def index
    @pictures = Picture.where(attachable_type: 'Restaurant')
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new

    if @restaurant.save
      if params[:images]
        params[:images].each { |image|
          @restaurant.pictures.create(image: image)
        }
      end
      redirect_to restaurants_path
    end
  end

  def delete
    @pictures = Picture.where(attachable_type: 'Restaurant')
  end

  def destroy_pictures
    @pictures = Picture.where(id: params[:pictures_ids])
    @pictures.each do |picture|
      picture.destroy
    end

    redirect_to restaurants_path
  end
end
