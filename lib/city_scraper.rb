
class CityScraper
  extend Deletable::ClassMethods
  attr_accessor :country, :city_table

  #initialize runs the scraper through the required methods of opening, collecting, creating cities
  def initialize(country)
    @country = country
    @city_table = open_page
    chunked = collect_cities
    create_cities(chunked)
  end

#opens the webpage to initiate the scraping process
  def open_page
    html = open(self.country.largest_cities_link)
    data = Nokogiri::HTML(html).css('table.restable.sortable').css('td')
    city_table = data.css('td').collect {|l| l}
    city_table
  end

#uses the collected data to iterate through and print out the pertinent text
  def collect_cities
    result = []
    chunked = []
      city_table.each_with_index do |v, i|
        if i > 0 && v.children.text.length > 2
          data = v.children.text
          result << data
        end
      end
    result

#collects 3 data points and associates them together
    while result.length > 3
      chunked << result.slice!(0,3)
    end
    chunked
  end

#creates new city objects based off of these collected datapoints
  def create_cities(chunked)
    chunked.collect do |city|
      city_name = city[0]
      population = city[1]
      location = city[2]
      country = self.country.name
      new = City.new(city_name, population, location, country)
      new
    end
  end
end
