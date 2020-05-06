require 'rails_helper'

RSpec.describe "shelter pet index", type: :feature do
  it "can see each pet at a particular shelter" do
    pet_1 = Pet.create(image: "???", name: "Donald Duck", approximate_age: "8", sex: "male", name_of_shelter: "Happy Puppies")
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
  end
end
