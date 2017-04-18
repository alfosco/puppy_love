class Shelter
  attr_reader :id,
              :name,
              :email,
              :phone,
              :city,
              :state,
              :zip,
              :longitude,
              :latitude

  def initialize(shelter = {})
    @id = shelter[:id][:$t]
    @name = shelter[:name][:$t]
    @email = shelter[:email][:$t]
    @phone = shelter[:phone][:$t]
    @city = shelter[:city][:$t]
    @state = shelter[:state][:$t]
    @zip = shelter[:zip][:$t]
    @longitude = shelter[:longitude][:$t]
    @latitude = shelter[:latitude][:$t]
  end

  def self.find_shelter(id)
    shelter = PetFinderService.find_shelter(id)
    Shelter.new(shelter)
  end
end
