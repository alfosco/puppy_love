require "rails_helper"

describe "Dog PORO" do
  it "returns array of dogs" do
    dogs = Dog.find_by_zip(76543)

    expect(dogs.count).to eq(25)
    expect(dogs).to be_a(Array)
  end

  it "finds a dog by its id" do
    dog = Dog.find_dog("35702896")

    expect(dog.name).to eq("Caiden")
    expect(dog.sex).to eq("M")
    expect(dog.age).to eq("Young")
    expect(dog.city).to eq("Denver")
    expect(dog.state).to eq("CO")
  end
end
