class PetFinderService

  def self.find_dogs_by_zip(zip_code)
    response = Faraday.get("http://api.petfinder.com/pet.find?format=json&key=#{Figaro.env.pet_finder_api_key}&location=#{zip_code}&breed=dog")
    dogs = JSON.parse(response.body, symbolize_names: true)[:petfinder][:pets][:pet]
  end

  def self.find_dog(id)
    response = Faraday.get("http://api.petfinder.com/pet.get?format=json&key=#{Figaro.env.pet_finder_api_key}&id=#{id}")
    dog = JSON.parse(response.body, symbolize_names: true)[:petfinder][:pet]
  end

  def self.find_shelter(id)
    response = Faraday.get("http://api.petfinder.com/shelter.get?format=json&key=#{Figaro.env.pet_finder_api_key}&id=#{id}")
    shelter = JSON.parse(response.body, symbolize_names: true)[:petfinder][:shelter]
  end

end
