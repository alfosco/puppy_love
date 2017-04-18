class Dog
  attr_reader :name,
              :sex,
              :description,
              :shelter,
              :image,
              :age,
              :breed,
              :city,
              :state,
              :id

  def initialize(dog = {})
    @id = dog[:id][:$t]
    @name = dog[:name][:$t]
    @sex = dog[:sex][:$t]
    @description = dog[:description][:$t]
    @shelter = dog[:shelterId][:$t]
    @image = dog[:media][:photos][:photo][2][:$t]
    @age = dog[:age][:$t]
    @breed = dog[:breeds][:breed]
    @city = dog[:contact][:city][:$t]
    @state = dog[:contact][:state][:$t]
  end

  def self.find_by_zip(zip_code)
    dogs = PetFinderService.find_dogs_by_zip(zip_code)

    dogs.map do |dog|
      Dog.new(dog)
    end
  end

  def self.find_dog(id)
    dog = PetFinderService.find_dog(id)
    Dog.new(dog)
  end

end
