
class Country
  attr_accessor :country_link, :name, :abbreviation, :largest_cities_link
  extend Deletable::ClassMethods
  @@all = []

#This uses the scraped information to make new countries
  def initialize(name, abbreviation, country_link)
    @name = name
    @abbreviation = abbreviation
    @country_link = country_link
    l_name = name.downcase.gsub(" ", "-")
    @largest_cities_link = "https://www.geonames.org/#{self.abbreviation}/largest-cities-in-#{l_name}.html"
    @@all << self
  end

#This displays all of the country objects
  def self.all
    @@all.sort! {|a,b| a.name <=> b.name}
  end

  def self.search_all_names(input)
    input = input.to_s
    result = []
    self.all.each do |v|
      if input == v.name[0]
      result << "#{v.name}"
    end
  end
    result
  end

#this allows you to look up a country object by country name
  def self.find_by_name(input)
      self.all.detect { |x| x.name == input }
  end

#looking up cities via using country object to initiate the city scraper
  def self.lookup_cities(name)
    country = self.find_by_name(name)
    country = CityScraper.new(country)
  end

#this allows the user to see the data displayed
  def info
    puts "Country Name: #{self.name}"
    puts "Country Abbreviation: #{self.abbreviation}"
    puts "Country Info link: #{self.country_link}"
  end

end
