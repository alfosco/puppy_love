require "rails_helper"

RSpec.feature "User clicks on a dogs link" do
  scenario "sees that dogs detailed information" do
    stub_omniauth
    visit root_path
    click_link "Sign in with Google"

    fill_in :search, with: "76543"
    click_on "Search"

    expect(current_path).to eq("/search")
    click_on "VOUCH"

    expect(current_path).to eq("/dogs/37874354")
    expect(page).to have_content("VOUCH")
    expect(page).to have_content("Sex: M")
    expect(page).to have_content("Age: Young")
    expect(page).to have_content("Mix Breed: German Shepherd Dog, Mixed Breed")
    expect(page).to have_content("Location: Killeen, TX, 76543")
    expect(page).to have_content("Killeen Animal Services")
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
