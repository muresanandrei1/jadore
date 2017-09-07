class MainController < ApplicationController
  def index
    @rooms = Room.all
    @testimonial = Testimonial.all
  end
end
