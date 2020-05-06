class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def shelter_pets
    shelter = Shelter.find(params[:shelter_id])
    @shelter_name = shelter.name
    @pets = Pet.where(name_of_shelter: @shelter_name)
  end

  def show
    @pet = Pet.find(params[:id])
  end

end
