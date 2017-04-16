class Dog
  attr_reader :name,
              :sex,
              :description,
              :shelter,
              :image,
              :age,
              :breed

  def initialize(dog = {})
    @name = dog[:name][:$t]
    @sex = dog[:sex][:$t]
    @description = dog[:description][:$t]
    @shelter = dog[:shelterId][:$t]
    @image = dog[:media][:photos][:photo][0][:$t]
    @age = dog[:age][:$t]
    @breed = dog[:breeds][:breed]
  end

  def self.find_by_zip(zip_code)
    dogs = PetFinderService.find_dogs_by_zip(zip_code)

    dogs.map do |dog|
      Dog.new(dog)
    end
  end

end
