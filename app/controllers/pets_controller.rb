class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:id]
  end

  def shelter_pets
    @shelter_id = params[:id]
    @pets = Pet.where(shelter_id: @shelter_id)
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
      # status
      shelter_id: params[:shelter_id]
      })
    pet.save
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update({
      image: params[:pet][:image],
      name: params[:pet][:name],
      description: params[:pet][:description],
      approximate_age: params[:pet][:approximate_age],
      sex: params[:pet][:sex],
      shelter_id: params[:pet][:shelter_id]
      })
    redirect_to "/pets/#{@pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

end
