require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see all shelter names" do
    shelter_1 = Shelter.create(name: "Happy Puppies")
    shelter_2 = Shelter.create(name: "Good Doggos")
    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
