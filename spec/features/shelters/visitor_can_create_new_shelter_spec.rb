require 'rails_helper'

RSpec.describe "shelter new page", type: :feature do
  it "can add new shelter" do
    visit "/shelters"
    click_link "New Shelter"
    expect(current_path).to eq("/shelters/new")
    fill_in "shelter[name]", with: "New Shelter"
    fill_in "shelter[address]", with: "123 Street"
    fill_in "shelter[city]", with: "New City"
    fill_in "shelter[state]", with: "New State"
    fill_in "shelter[zip]", with: "99999"
    click_button "Create Shelter"
    expect(current_path).to eq("/shelters")
    expect(page).to have_content("New Shelter")
  end
end
