require 'rails_helper'

RSpec.describe "shelter show", type: :feature do
  it "can display link to shelter's pets page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    # pet_1 = Pet.create(image: "???", name: "Donald Duck", approximate_age: "8", sex: "male", shelter_id: shelter_1.id)
    visit "/shelters/#{shelter_1.id}"
    click_link "View Pets"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
  end
end
