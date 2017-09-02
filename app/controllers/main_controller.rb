class MainController < ApplicationController
  def index
    @rooms = Room.all
  end
end
