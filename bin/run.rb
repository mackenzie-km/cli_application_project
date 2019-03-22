#!/usr/bin/env ruby
require_relative '../config/environment'

Cli.new.start


  # Current bugs/things to seek help for:
  # 1) When it prints city name, there's a big white space "  , " caused by a
  # image of a globe. This white space is not responding to
  # regex (like /\W\W,\W/) or string (gsub, etc.) methods.
  # 2) Strange characters? Like "GuantÃ¡namo  , GuantÃ¡namo"

  # Lingering to-dos:
  # 1) Walkthrough & blog post
  # 2) Readme 
