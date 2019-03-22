#!/usr/bin/env ruby
require_relative '../config/environment'

cli = Cli.new
cli.start


  # Current bugs/things to seek help for:
  # 1) Noticed it's not pulling up the last city of every page
  # 2) When it prints city name, there's a big white space "  , " caused by a
  # image of a globe. This white space is not responding to
  # regex (like /\W\W,\W/) or string (gsub, etc.) methods.
  # 3) Strange characters? Like "GuantÃ¡namo  , GuantÃ¡namo"

  # Tomorrow to-dos
  # 1) May be good to add .reset feature to classes in concern bin
  # 2) DRY...
  # 3) Walkthrough
