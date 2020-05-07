require 'rails_helper'

RSpec.describe "shelter update", type: :feature do
  it "can access edit from index page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    visit "/shelters"
    click_link "Edit #{shelter_1.name} Information"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end
end
