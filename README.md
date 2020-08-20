
## ATM Locator: 

A Ruby CLI application for finding bank owned or in-bank ATM locations by ZIP code in New York State. 

## GENERAL INFO:

ATM Locator was developed as a Flatiron School Web Developement Modual 1 project to demonstrate working knowledge of Relational Database Management, Active Records Associations and Create, Read, Update and Delete (CRUD) methods.

## TECH STACK: 

This web app employs the following technologies:
1. Ruby [2.6.1]
2. SQLite3 [~> 1.4] - Database
3. Sinatra-activerecord - Gem that extends Sinatra with ActiveRecord helper methods and Rake tasks
4. TTY::Prompt - Gem that provides easy option selection
5. CSV - Gem that provides a complete interface to CSV files and data
6. Colorize - Gem for colorizing text using ANSI escape sequences 
7. Rake - Task manager 

## SOURCE FOR DATA
A list of all bank owned or in-bank ATMs located in New York State can be downloaded in CSV format [here.](https://data.ny.gov/Government-Finance/Bank-Owned-ATM-Locations-in-New-York-State/ndex-ad5r)

## SETUP:

1. Clone this repo to your local machine git clone [here](https://github.com/wilsonvetdev/ATM-Locator)
2. Run cd ATMlocator with -b to access this project
3. Run bundle install to install required dependencies
4. Run rake db:migrate to create tables into the database
5. Run rake db:seed to create seed data
6. Run rake start to run the app 
 
## STATUS: 

 Project is Completed for our purposes here.  
 NY State data includes longitude and latitude cooridinates.  Additional functionality can be built to show distance from user address input to ATMs using [Ruby Geocoder Gem](http://www.rubygeocoder.com/).  
 Dataset also available through Socrata Open Data API (SODA) [here.](https://data.ny.gov/resource/ndex-ad5r.json)

## COLLABORATOR CONTACT: 

[SA Williams](https://github.com/evilgeniusnyc)

