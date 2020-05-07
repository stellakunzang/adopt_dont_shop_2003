require 'rails_helper'

RSpec.describe "pet update page", type: :feature do
  it "can update pet" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    pet_1 = Pet.create(image: "dog.jpg", name: "Donald Duck", description: "Certified cutie patootie", approximate_age: "8", sex: "male", shelter_id: shelter_1.id)
    visit "/pets/#{pet_1.id}/edit"
    fill_in "pet[image]", with: pet_1.image
    fill_in "pet[name]", with: pet_1.name
    fill_in "pet[description]", with: pet_1.description
    fill_in "pet[approximate_age]", with: pet_1.approximate_age
    fill_in "pet[sex]", with: pet_1.sex
    click_button "Update Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}")
    # expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content("Certified cutie patootie")
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
  end
end
