require 'rails_helper'

RSpec.describe "shelter delete", type: :feature do
  it "can access delete from index page" do
    shelter_1 = Shelter.create(name: "Happy Puppies", address: "55 Street st", city: "Newark", state: "NK", zip: "80304")
    visit "/shelters"
    click_link "Delete #{shelter_1.name}"
    expect(current_path).to eq("/shelters")
    expect(page).to have_no_content("Happy Puppies")
  end
end
