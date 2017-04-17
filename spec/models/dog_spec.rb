require "rails_helper"

describe "Dog PORO" do
  it "returns dogs by zipcode" do
    dogs = PetFinderService.find_dogs_by_zip(80218)

    expect(dogs.count).to eq(25)
    expect(dogs.first.class).to eq(Hash)
  end
end
