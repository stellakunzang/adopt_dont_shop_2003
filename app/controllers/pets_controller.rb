class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
  end

  def shelter_pets
    @shelter = Shelter.find(params[:shelter_id])
    @shelter_name = shelter.name
    @pets = Pet.where(name_of_shelter: @shelter_name)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    pet = Pet.new({
      image: params[:pet][:image],
      name: params[:pet][:name],
      description: params[:pet][:description],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      status: "adoptable"
      })
    pet.save
    redirect_to "/shelters/#{shelter_1.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      image: params[:pet][:image],
      name: params[:pet][:name],
      description: params[:pet][:description],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex]
      })
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

end
