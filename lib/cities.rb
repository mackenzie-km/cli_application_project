require "/Users/Mackenzie/Desktop/RubyWork/ten_largest_cities/config/environment.rb"

class City
  attr_accessor :city_name, :population, :location, :country

  @@all = []

#This uses the scraped information to make new countries
  def initialize(city_name, population, location, country)
    @city_name = city_name
    @population = population
    @location = location
    @country = country
    @@all << self
  end

#This displays all of the country objects
  def self.all
    @@all
  end

end
