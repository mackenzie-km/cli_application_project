#!/usr/bin/env ruby
require_relative '../config/environment'

Scraper.new
puts "Hello there. Please choose which country you'd like to learn about!"
puts "Please input the first letter of the country name."
letter = gets.strip.upcase
list = Country.search_all_names(letter)
puts list
puts "Please type the name of the desired country."
name = gets.strip.downcase
country = Country.find_by_name(name)
puts "\n\nGreat! Let's take a look."
country.info
puts "\nDo you want to learn more about this country's largest cities? (Y/N)"
continue = gets.strip
cities = CityScraper.new(country)
puts City.all
puts "That's all I got! Please check out the links provided for additional info."
