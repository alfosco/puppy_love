require 'rails_helper'

describe PetFinderService do
  attr_reader :service

  before(:each) do
    @service = PetFinderService.new
  end

  describe 'User' do
    it 'finds all rescue dogs per zip code' do
      dogs = @service.find_dogs("80218")
      dog  = dogs.first

      expect(dogs.count).to eq(20)
      expect(dog[:name]).to eq('Sadi the Gryffindor')
      expect(dog[:sex]).to eq('F')
    end
  end

end
