class PetFinderService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('http://api.petfinder.com')
    api_key
    api_secret
    endpoint
  end

  def dogs(criteria)
    parse(connection.get('dogs', criteria))[:results]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
