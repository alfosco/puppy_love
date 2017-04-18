require "rails_helper"

describe "User clicks on a dogs link" do
  it "sees that dogs detailed information" do
    visit root_path
    stub_omniauth
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

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] =
      OmniAuth::AuthHash.new({
        provider: "google",
           uid: "12345678910",
           info: {
             email: "alex.hf88@gmail.com",
             first_name: "Alex",
             last_name: "Fosco"
           },
           credentials: {
             token: "abcdefg12345",
             refresh_token: "12345abcdefg",
             expires_at: DateTime.now,
           }
        })
  end
end
