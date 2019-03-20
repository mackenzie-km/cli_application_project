#!/usr/bin/env ruby
require 'require_all'
require_all 'config'

#CLI PSUEDOCODE
#Welcome. To get started, please choose a country of interest.
#Some input

def test
Scraper.new
canada = Country.find_by_name("Canada")
cities = CityScraper.new(canada)
City.all
end

test 
