
class CityScraper
  attr_accessor :country, :city_table
  def initialize(country)
    @country = country
    @city_table = open_page
    city_table = collect_cities
    create_cities(city_table)
  end

  def open_page
    html = open(self.country.largest_cities_link)
    city_table = Nokogiri::HTML(html).css('table.restable.sortable')
    city_table = city_table.css('tr', 'td').collect {|l| l}
    city_table
  end

  def collect_cities
    result = []
    chunked = []
      city_table.collect do |n|
          city_data = n.text.split("\n")
          city_data.reject!(&:empty?)
          result << city_data
      end
      #SOME ISSUES STILL WITH FORMATTING & CHECK THAT CITIES R BUILT
      puts result
      result

    while result.length > 3
      chunked << result.slice!(0,3)
    end
    chunked

  end

  def create_cities(city_table)
    city_table.each do |city|
      city_name = city[1]
      population = city[2]
      location = city[0]
      country = self.country.name
      name = City.new(city_name, population, location, country)
    end
  end

end
