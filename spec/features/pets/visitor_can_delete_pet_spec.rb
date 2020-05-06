require 'rails_helper'

RSpec.describe "pet delete", type: :feature do
  it "can delete a pet" do
    pet_1 = Pet.create(image: "???", name: "Donald Duck", approximate_age: "8", sex: "male", name_of_shelter: "Happy Puppies")
    visit "/pets/#{pet_1.id}"
    click_link "Delete Pet"
    expect(current_path).to eq("/pets")
    expect(page).to have_no_content("Donald Duck")
  end
end 
