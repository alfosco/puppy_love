class Shelter
  attr_reader :id,
              :name,
              :email,
              :phone,
              :city,
              :state,
              :zip,
              :google_map_api_key

  def initialize(shelter = {})
    @id = shelter[:id][:$t]
    @name = shelter[:name][:$t]
    @email = shelter[:email][:$t]
    @phone = shelter[:phone][:$t]
    @city = shelter[:city][:$t]
    @state = shelter[:state][:$t]
    @zip = shelter[:zip][:$t]
    @google_map_api_key = Figaro.env.google_map_api_key
  end

  def self.find_shelter(id)
    shelter = PetFinderService.find_shelter(id)
    Shelter.new(shelter)
  end

  def remove_spaces_from_name
    name.tr(" ", "+")
  end
end
