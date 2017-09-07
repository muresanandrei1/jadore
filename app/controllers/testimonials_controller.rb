class TestimonialsController < ApplicationController
  before_action :authenticate_admin!, only: ['new', 'destroy', 'update', 'edit']
  def show
    @testimonial = Testimonial.find(params[:id])
  end

  def new
    @testimonial = Testimonial.new
  end

  def index
    @testimonial = Testimonial.all
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      redirect_to @testimonial
    else
      render 'new'
    end
  end

  def edit
    @testimonial = Testimonial.find(params[:id])
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    if @testimonial.update(room_params)
      redirect_to @testimonial
    else
      render 'edit'
    end
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy
    redirect_to testimonials_path
  end

  private
    def testimonial_params
      params.require(:testimonial).permit(:name, :firm, :description)
    end
end
