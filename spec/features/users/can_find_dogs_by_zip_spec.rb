require "rails_helper"

describe "User searches for dogs by zipcode" do
  it "returns the 25 dogs closest to entered zip code" do
    visit root_path
    fill_in :search, with: "80218"
    click_on "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("25 dogs were found")
    expect(page).to have_css(".dog", count: 25)

    within first(".dog") do
      expect(page).to have_content("Name: Sadi the Gryffindor")
      expect(page).to have_content("Sex: F")
      expect(page).to have_content("Age: Senior")
      expect(page).to have_content("Mix Breed: Australian Shepherd, German Shepherd Dog")
      expect(page).to have_content("Location: Denver, CO")
    end
  end

end
