class ShelterPetsController < ApplicationController

  def index
    @shelter_id = params[:id]
    @pets = Pet.where(shelter_id: @shelter_id)
  end

end
