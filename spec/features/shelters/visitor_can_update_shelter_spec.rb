require 'rails_helper'

RSpec.describe "shelter edit/update", type: :feature do
  it "can update the shelter details" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    visit "/shelters/#{shelter_1.id}"
    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    fill_in "shelter[name]", with: "New Shelter"
    fill_in "shelter[address]", with: "123 Street"
    fill_in "shelter[city]", with: "New City"
    fill_in "shelter[state]", with: "New State"
    fill_in "shelter[zip]", with: "99999"
    click_button "Submit"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("New Shelter")
    expect(page).to have_content("123 Street")
    expect(page).to have_content("New City")
    expect(page).to have_content("New State")
    expect(page).to have_content("99999")
  end
end
