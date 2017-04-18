require "rails_helper"

describe "User clicks on a dogs link" do
  it "sees that dogs detailed information" do
    visit root_path
    fill_in :search, with: "80218"
    click_on "Search"

    expect(current_path).to eq("/search")
    click_on "Caiden"

    expect(current_path).to eq("/dogs/35702896")
    expect(page).to have_content("Caiden")
    expect(page).to have_content("Sex: M")
    expect(page).to have_content("Age: Young")
    expect(page).to have_content("Mix Breed: Doberman Pinscher, Australian Cattle Dog (Blue Heeler)")
    expect(page).to have_content("Location: Denver, CO")
    expect(page).to have_content("Saving Dobermankind Animal Rescue")
  end
end
