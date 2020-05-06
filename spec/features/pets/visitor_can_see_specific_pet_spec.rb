require 'rails_helper'

RSpec.describe "pet show", type: :feature do
  it "can show pet with particular id" do
    pet_1 = Pet.create(image: "???", name: "Donald Duck", approximate_age: "8", sex: "male", name_of_shelter: "Happy Puppies")
    visit "/pets/#{pet_1.id}"
    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
  end
end
