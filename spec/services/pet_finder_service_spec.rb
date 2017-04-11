require 'rails_helper'

describe PetFinderService do
  attr_reader :service

  before(:each) do
    @service = PetFinderService.new
  end

  describe 'dogs' do
    it 'finds all rescue dogs' do
      dogs = @service.dogs(gender: "F")
      dog  = dogs.first

      expect(dogs.count).to eq(20)
      expect(dog[:first_name]).to eq('Cleveland')
      expect(dog[:last_name]).to eq('Brown')
    end
  end

end
