require "rails_helper"

describe "Dog PORO" do
  it "returns dogs by zipcode" do
    dogs = PetFinderService.find_dogs_by_zip(80218)

    expect(dogs.count).to eq(25)
    expect(dogs.first.class).to eq(Hash)
  end

  it "finds a dog by its id" do
    dog = PetFinderService.find_dog("35702896")

    expect(dog.class).to eq(Hash)
    expect(dog[:name][:$t]).to eq("Caiden")
    expect(dog[:sex][:$t]).to eq("M")
    expect(dog[:age][:$t]).to eq("Young")
  end
end
