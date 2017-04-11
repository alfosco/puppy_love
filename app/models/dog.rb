class Dog
  attr_reader :service

  def self.service
    @service ||= PetFinderService.new
  end

  def self.find_by(criteria)
  end

end
