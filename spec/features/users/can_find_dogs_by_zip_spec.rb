require "rails_helper"

RSpec.feature "User searches for dogs by zipcode" do
  scenario "returns the 25 dogs closest to entered zip code" do
    stub_omniauth
    visit root_path
    click_link "Sign in with Google"
    
    fill_in :search, with: "80218"
    click_on "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("25 dogs were found")
    expect(page).to have_css(".dog", count: 25)

    within first(".dog") do
      expect(page).to have_content("Sadi the Gryffindor")
      expect(page).to have_content("Sex: F")
      expect(page).to have_content("Age: Senior")
      expect(page).to have_content("Mix Breed: Australian Shepherd, German Shepherd Dog")
      expect(page).to have_content("Location: Denver, CO")
    end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        provider: "google",
        uid: "12345678910",
        info: {
          email: "alex.hf88@gmail.com",
          first_name: "Alex",
          last_name: "Fosco"
        },
        credentials: {
          oauth_token: "abcdefg12345",
          refresh_token: "12345abcdefg",
          expires_at: DateTime.now,
        }
    })
  end

end
