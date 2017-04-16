class PetFinderService

  def self.find_dogs_by_zip(zip_code)
    response = Faraday.get("http://api.petfinder.com/pet.find?format=json&key=#{Figaro.env.pet_finder_api_key}&location=#{zip_code}&breed=dog")
    dogs = JSON.parse(response.body, symbolize_names: true)[:petfinder][:pets][:pet]
  end

end
