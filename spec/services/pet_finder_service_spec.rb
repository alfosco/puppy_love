require 'rails_helper'

describe 'Pet Finder Service' do
  it 'finds all rescue dogs per zip code' do
    dogs = PetFinderService.find_dogs_by_zip(80218)
    dog  = dogs.first

    expect(dogs.count).to eq(25)
    expect(dogs.class).to eq(Array)
    expect(dog[:name][:$t]).to eq("Sadi the Gryffindor")
    expect(dog[:sex][:$t]).to eq("F")
    expect(dog[:age][:$t]).to eq("Senior")
  end
end
