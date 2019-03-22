class Scraper
  extend Deletable::ClassMethods
#Scraper.new pulls methods together: open the page, scrape, and instantiate new countries
  def initialize
    country_table = open_page
    country_table = collect_countries(country_table)
    create_countries(country_table)
  end

#this opens our website url and stores it as a zoomed-in array
  def open_page
    html = open("https://www.geonames.org/countries/")
    country_table = Nokogiri::HTML(html).css('#countries')
    country_table = country_table.css('td').css('a').collect {|l| l}
  end

#this iterates over the country table data to chunk together data
  def collect_countries(country_table)
    result = []
    chunked = []

    country_table.each_with_index do |v, i|
      if i.even?
        country_abbreviation = v.attributes['name'].value
        result << country_abbreviation
      else
        country_name = v.children.text
        country_link = v.attributes['href'].value
        result << country_name
        result << "https://www.geonames.org#{country_link}"
      end
  end
#taking each set of three data points and associating them together
  while result.length > 3
    chunked << result.slice!(0,3)
  end
  chunked
end

#this creates new countries based on the data chunks
def create_countries(country_table)
    country_table.each do |country|
      abbreviation = country[0]
      name = country[1]
      info_link = country[2]
      name = Country.new(name, abbreviation, info_link)
    end
end

end
