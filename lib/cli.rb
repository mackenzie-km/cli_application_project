class Cli
attr_accessor :country

#welcome message and first menu option - search or exit. posts country list if selected.
def start
  puts "\nIt's time to learn about countries and their largest cities!".blue
  puts "Browse the menu by typing the first letter of a country's name - or type 'exit'.".blue
  letter = gets.strip.upcase
    if letter == "EXIT"
      finished
    elsif (letter != "EXIT" && ("A".."Z").to_a.include?(letter))
        Scraper.new
        list = Country.search_all_names(letter)
        puts list
        puts "\n"
        country_info
    else
      start
    end
end

#second menu option - choose a country? posts country information if selected
def country_info
  puts "\nPlease type the name of the desired country.".blue
  name = gets.strip.downcase
  if Country.find_by_name(name) != nil
    self.country = Country.find_by_name(name)
    puts "\nGreat! Let's take a look.\n".blue
    list = self.country.info
    puts list
    city_info
  else
    country_info
  end
end

#third menu option - continue to city data, or quit? posts city data if selected
def city_info
  puts "\nDo you want to learn more about #{self.country.name}'s largest cities? (Y/N)".blue
  continue = gets.strip.upcase
  if continue == "Y"
    CityScraper.new(self.country)
    puts "\n"
    list = City.info
    puts list
    puts "Additional City Information:"
    puts "#{self.country.largest_cities_link}"
    finished
  elsif continue == "N"
    finished
  else
    city_info
  end
end

#finishes program
def finished
  puts "\n"
  puts "Do you want to learn about a new country? (Y/N)".blue
  continue = gets.strip.upcase
    if continue == "Y"
      Country.all.clear
      City.all.clear
      Cli.new.start
    elsif continue == "N"
      puts "That's all I got! Please check out the links provided for additional info.".blue
      puts "\n"
    else
      finished
    end
end


end
