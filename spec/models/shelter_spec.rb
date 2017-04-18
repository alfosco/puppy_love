require "rails_helper"

describe "Shelter PORO" do
  it "finds a shelter by its id" do
    shelter = PetFinderService.find_shelter("CO453")

    expect(shelter.class).to eq(Hash)
    expect(shelter[:name][:$t]).to eq("Saving Dobermankind Animal Rescue")
    expect(shelter[:phone][:$t]).to eq("720-722-4277")
    expect(shelter[:email][:$t]).to eq("hookedondobies@gmail.com")
  end
end
