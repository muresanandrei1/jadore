class PoolsController < ApplicationController
  def index
    @pictures = Picture.where(attachable_type: 'Pool')
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new

    if @pool.save
      if params[:images]
        params[:images].each { |image|
          @pool.pictures.create(image: image)
        }
      end
      redirect_to pools_path
    end
  end

  def delete
    @pictures = Picture.where(attachable_type: 'Pool')
  end

  def destroy_pictures
    @pictures = Picture.where(id: params[:pictures_ids])
    @pictures.each do |picture|
      picture.destroy
    end

    redirect_to pools_path
  end
end
