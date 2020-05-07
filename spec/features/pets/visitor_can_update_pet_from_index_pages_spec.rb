require 'rails_helper'

RSpec.describe "pet update", type: :feature do
  it "can update pet from index page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    pet_1 = Pet.create(image: "dog.jpg", name: "Donald Duck", description: "Certified cutie patootie", approximate_age: "8", sex: "male", shelter_id: shelter_1.id)
    visit "/pets"
    click_link "Edit Pet Information"
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end

  it "can update pet from shelter pets page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    pet_1 = Pet.create(image: "dog.jpg", name: "Donald Duck", description: "Certified cutie patootie", approximate_age: "8", sex: "male", shelter_id: shelter_1.id)
    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Edit Pet Information"
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end
end
