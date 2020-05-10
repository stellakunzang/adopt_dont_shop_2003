class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    Pet.create({
      image: params[:image],
      name: params[:name],
      description: params[:description],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      shelter_id: params[:id]
      })
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update!(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :shelter_id)
  end

end
