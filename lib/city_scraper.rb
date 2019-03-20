#requiring gems/modules
require "/Users/Mackenzie/Desktop/RubyWork/ten_largest_cities/config/environment.rb"
require 'nokogiri'
require 'open-uri'

class CityScraper
  attr_accessor :country
  def initialize(country)
    @country = country
    cities_data = open_cities
    city_table = collect_cities(cities_data)
    create_cities(city_table)
  end

  def open_cities
    html = open(self.country.largest_cities_link)
    city_table = Nokogiri::HTML(html).css('table.restable.sortable')
    city_table = city_table.css('tr', 'td').collect {|l| l}
  end

  def collect_cities(cities_data)
    result = []
      cities_data[0].children.each_with_index do |v, i|
        if (i.odd? && i > 2)
          city_name = v.children[1].children.children.text
          population = v.children[3].children.text
          location = v.children.children[6].text

          result << [city_name, population, location]
        end
      end
      result
  end

  def create_cities(city_table)
    city_table.each do |city|
      city_name = city[0]
      population = city[1]
      location = city[2]
      country = self.country.name
      name = City.new(city_name, population, location, country)
    end
  end

end
