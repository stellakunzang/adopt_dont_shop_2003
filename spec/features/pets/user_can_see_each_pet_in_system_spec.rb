require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see each pet in the system" do
    pet_1 = Pet.create(image: "???", name: "Donald Duck", approximate_age: "8", sex: "male", name_of_shelter: "Happy Puppies")
    visit "/pets"
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.name_of_shelter)
  end
end
