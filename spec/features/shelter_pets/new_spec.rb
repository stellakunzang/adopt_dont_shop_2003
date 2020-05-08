require 'rails_helper'

RSpec.describe "shelter pet new page" do
  it "can create new shelter pets" do

    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street St", city: "Danger Mountain", state: "UT", zip: "80304")

    visit "/shelters/#{shelter_1.id}/pets"

    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    fill_in "pet[image]", with: "image.jpeg"
    fill_in "pet[name]", with: "Kunga"
    fill_in "pet[description]", with: "Certified cutie patootie"
    fill_in "pet[approximate_age]", with: "1"
    fill_in "pet[sex]", with: "male"

    click_button "Create Pet"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_css("img[src*='image.jpeg']")
    expect(page).to have_content("Kunga")
    expect(page).to have_content("Certified cutie patootie")
    expect(page).to have_content("male")
    expect(page).to have_content("adoptable")
  end
end