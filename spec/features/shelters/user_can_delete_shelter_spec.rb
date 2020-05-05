require 'rails_helper'

RSpec.describe "shelter delete", type: :feature do
  it "can update the shelter details" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    visit "/shelters/#{shelter_1.id}"
    click_link "Delete Shelter"
    expect(current_path).to eq("/shelters")
    expect(page).to have_no_content("Happy Puppies")
  end
end
