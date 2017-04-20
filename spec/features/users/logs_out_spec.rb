require "rails_helper"

RSpec.feature "User logs out" do
  scenario "clicks log out link" do
    stub_omniauth
    visit root_path

    expect(page).to have_link("Sign in with Google")

    click_link "Sign in with Google"
    expect(page).to have_content("Alex Fosco")
    expect(page).to have_link("Sign out")

    click_link "Sign out"
    expect(page).to have_content("Logged Out")
    expect(current_path).to eq("/")
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
