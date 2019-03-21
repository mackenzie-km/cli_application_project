
class City
  attr_accessor :city_name, :population, :location, :country

  @@all = []

#This uses the scraped information to make new cities
  def initialize(city_name, population, location, country)
    @city_name = city_name
    @population = population
    @location = location
    @country = country
    @@all << self
  end

#This displays all of the city objects
  def self.all
    @@all
  end

end
