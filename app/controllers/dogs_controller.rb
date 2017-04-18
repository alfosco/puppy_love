class DogsController < ApplicationController
  def index
  end

  def show
    @id = params[:id]
    @dog = Dog.find_dog(@id)
    @shelter = Shelter.find_shelter(@dog.shelter)
  end
end
