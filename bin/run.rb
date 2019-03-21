#!/usr/bin/env ruby
require_relative '../config/environment'

Scraper.new
canada = Country.lookup_cities("Canada")
puts City.all
