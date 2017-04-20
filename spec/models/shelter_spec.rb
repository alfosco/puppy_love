require "rails_helper"

describe "Shelter PORO" do
  it "finds a shelter by its id" do
    shelter = Shelter.find_shelter("CO453")

    expect(shelter.name).to eq("Saving Dobermankind Animal Rescue")
    expect(shelter.phone).to eq("720-722-4277")
    expect(shelter.email).to eq("hookedondobies@gmail.com")
  end

  it "removes white space from shelter name" do
    shelter = Shelter.find_shelter("CO453")
    name = shelter.name

    expect(shelter.name).to eq("Saving Dobermankind Animal Rescue")

    expect(shelter.remove_spaces_from_name).to eq("Saving+Dobermankind+Animal+Rescue")
  end
end
