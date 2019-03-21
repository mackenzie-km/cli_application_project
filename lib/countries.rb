
class Country
  attr_accessor :info_link, :name, :abbreviation, :largest_cities_link

  @@all = []

#This uses the scraped information to make new countries
  def initialize(name, abbreviation, info_link)
    @name = name
    @abbreviation = abbreviation
    @info_link = info_link
    @@all << self
  end

#This displays all of the country objects
  def self.all
    @@all.sort! {|a,b| a.name <=> b.name}
    @@all
  end

  def self.all_names
    result = []
    self.all.each_with_index do |v, i|
      result << "#{i} - #{v.name}"
    end
    result
  end

  def self.find_by_name(name)
      self.all.detect { |x| x.name == name }
  end

  def self.lookup_cities(name)
    country = self.find_by_name(name)
    country = CityScraper.new(country)
  end

  def largest_cities_link
    name = self.name.downcase.gsub(" ", "-")
    @largest_cities_link = "https://www.geonames.org/#{self.abbreviation}/largest-cities-in-#{name}.html"
  end

end
