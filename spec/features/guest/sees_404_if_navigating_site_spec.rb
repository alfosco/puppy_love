require "rails_helper"

RSpec.feature "Guest sees 404" do
  scenario "tries to navigate to search index" do
    visit "/search"

    expect(page).to have_content("You do not have access to this page.")
    expect(page).to have_content("Please go back and log in with Google.")
  end
end
