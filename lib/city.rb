
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

#this allows the user to see the desired city data displayed
  def self.info
    i = 0
  self.all.collect do |city|
      puts "#{i+=1}. #{city.city_name}".light_blue
      puts "Population: #{city.population}"
      puts "Coordinates: #{city.location}"
    end
      puts "\n"
  end

end
