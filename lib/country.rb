
class Country
  attr_accessor :info_link, :name, :abbreviation, :largest_cities_link

  @@all = []

#This uses the scraped information to make new countries
  def initialize(name, abbreviation, info_link)
    @name = name
    @abbreviation = abbreviation
    @info_link = info_link
    l_name = name.downcase.gsub(" ", "-")
    @largest_cities_link = "https://www.geonames.org/#{self.abbreviation}/largest-cities-in-#{l_name}.html"
    @@all << self
  end

#This displays all of the country objects
  def self.all
    @@all.sort! {|a,b| a.name <=> b.name}
    @@all
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

  def self.find_by_name(input)
      self.all.detect { |x| x.name.downcase == input }
  end

  def self.lookup_cities(name)
    country = self.find_by_name(name)
    country = CityScraper.new(country)
  end

  def info
    puts "Country Name: #{self.name}"
    puts "Country Abbreviation: #{self.abbreviation}"
    puts "Country Info link: #{self.info_link}"
  end

end
