class SheltersController < ApplicationController
  def index
    @shelters = ['Shelter 1', 'Shelter 2']
  end

  def new
  end

  def create
    # shelter = Shelter.new({
    #   name: params[:shelter][:name],
    #   address: params[:shelter][:address],
    #   city: params[:shelter][:city],
    #   state: params[:shelter][:state],
    #   zip: params[:shelter][:zip]
    #   })
    # shelter.save
    # redirect_to '/shelters'
  end
  #
  # def show
  #   @shelter = Shelter.find(params[:id])
  # end
  #
  # def edit
  #   @shelter = Shelter.find(params[:id])
  # end

end
