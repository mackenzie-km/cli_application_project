# Ten Largest Cities


This Ruby Gem provides a CLI to view country facts and city facts per the Geonames Country website.
Original data credited to https://www.geonames.org/countries/


## Installation & useage
Clone repository.

$ cd downloads (or appropriate location where file has been saved)

$ cd ten_largest_cities-master

$ bin/run.rb

Follow the colorized on-screen prompts.


## Contributing
New features for this gem are welcome.

The goal of my project was to learn how to create a CLI application while also learning about different countries of the world.

Please help us all learn!

Please visit GitHub at https://github.com/mackenzie-km/ten_largest_cities to check out the repo.

## Known Bugs/Issues
We are currently experiencing an encoding issue with the output of some city names.

When a city name has an accent mark in it, such as Ōsaka, the letter changes (example: Å).
These strings do not respond to .unicode_normalize.
These strings are displaying as UTF-8 when city_name.encoding is called.
It also returns true for valid_encoding?

Any feedback is welcome.


## License
This gem is available as open source under the terms of the MIT License
