class Cli
attr_accessor :country

def start
  puts "\nHello there. Please choose which country you'd like to learn about!"
  puts "Please input the first letter of the country name - or type 'exit'."
  letter = gets.strip.upcase
    if letter == "EXIT"
      finished
    elsif (letter != "EXIT" && Country.search_all_names(letter) != nil)
        Scraper.new
        list = Country.search_all_names(letter)
        puts "\n"
        puts list
        country_info
    else
      display_country_list
    end
end

def country_info
  puts "\nPlease type the name of the desired country."
  name = gets.strip.downcase.capitalize
  if Country.find_by_name(name) != nil
    self.country = Country.find_by_name(name)
    puts "\nGreat! Let's take a look."
    self.country.info
    city_info
  else
    country_info
  end
end

def city_info
  puts "\nDo you want to learn more about #{self.country.name}'s largest cities? (Y/N)"
  continue = gets.strip.upcase
  if continue == "Y"
    CityScraper.new(self.country)
    puts "\n"
    City.info
    finished
  elsif continue == "N"
    finished
  else
    city_info
  end
end

def finished
puts "\nThat's all I got! Please check out the links provided for additional info."
puts "#{self.country.largest_cities_link}"
puts "#{self.country.info_link}"
puts "\n"
end

end
