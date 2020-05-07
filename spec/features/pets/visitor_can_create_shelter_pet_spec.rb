require 'rails_helper'

RSpec.describe "shelter pet create", type: :feature do
  it "can create new shelter pets" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    pet_1 = Pet.create(image: "???", name: "Donald Duck", approximate_age: "8", sex: "male", shelter_id: shelter_1.id)
    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
    fill_in "pet[image]", with: pet_1.image
    fill_in "pet[name]", with: pet_1.name
    fill_in "pet[description]", with: "certified cutie patootie"
    fill_in "pet[approximate_age]", with: pet_1.approximate_age
    fill_in "pet[sex]", with: pet_1.sex
    click_button "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("Donald Duck")
    expect(page).to have_content("adoptable")
  end
end
