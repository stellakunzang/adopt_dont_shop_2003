require 'rails_helper'

RSpec.describe "pet update page", type: :feature do
  it "can update pet" do
    pet_1 = Pet.create(image: "???", name: "Donald Duck", approximate_age: "8", sex: "male", name_of_shelter: "Happy Puppies")
    visit "/pets/#{pet_1.id}"
    fill_in "pets[image]", with: pet_1.image
    fill_in "pets[name]", with: pet_1.name
    fill_in "pets[description]", with: "Certified cutie patootie"
    fill_in "pets[approximate_age]", with: pet_1.approximate_age
    fill_in "pets[sex]", with: pet_1.sex
    click_button "Update Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content("Certified cutie patootie")
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
  end
end
