require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see each pet in the system" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    pet_1 = Pet.create(image: "???", name: "Donald Duck", approximate_age: "8", sex: "male", shelter_id: shelter_1.id)
    visit "/pets"
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.name_of_shelter)
  end
end
