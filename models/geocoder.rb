#
require 'rest-client'
require 'json'
require 'pry'
# returntype = locations (for geocode) or geographies (for geocode + geoLookup)
# searchtype = onelineaddress OR address OR coordinates
#
#
# https://geocoding.geo.census.gov/geocoder/returntype /searchtype?parameters
#"https://geocoding.geo.census.gov/geocoder/locations/onelineaddress?  &benchmark=9&format=json"
  # response = RestClient.get "https://geocoding.geo.census.gov/geocoder/locations/onelineaddress?address=4600+Silver+Hill+Rd%2C+Suitland%2C+MD+20746&benchmark=9&format=json"
  # json = JSON.parse(response.body)

  #puts json

  def get_address(street_number:, street:, city:, state:, zip:)
    response = RestClient.get "https://geocoding.geo.census.gov/geocoder/locations/onelineaddress?address=#{street_number}+#{street}%2C+#{city}%2C+#{state}+#{zip}&benchmark=9&format=json"
    json = JSON.parse(response.body)
  end

  def long_lat_hash(loc_hash)
    loc_hash["result"]["addressMatches"].map do |item|
      item["coordinates"]
      end
    end

    def longitude(x_y_hash)
      binding.pry
      x_y_hash[0]["x"]
    end

    def latitude(x_y_hash)
      x_y_hash[0]["y"]
    end


    def format_street_city(street_string)
      st_ar = street_string.split(" ")
      st_ar.join("+")
    end

  # puts "Enter street number:"
  #   street_number = gets.chomp
  # puts "Enter street name:"
  #   street_name = gets.chomp
  #   street_name = format_street_city(street_name)
  # puts "Enter name of city:"
  #   city_name = gets.chomp
  #   city_name = format_street_city(city_name)
  # puts "Enter state abreviation (i.e. NY):"
  #   state_name = gets.chomp
  # puts "Enter zip code:"
  #   zip_code = gets.chomp

#puts return_long_lat(get_address(street_number: street_number, street: street_name, city: city_name, state: state_name, zip: zip_code))
puts longitude(long_lat_hash(get_address(street_number: "98", street: "Central+Ave", city: "Brooklyn", state: "NY", zip: "11206")))
  # response = RestClient.get "https://geocoding.geo.census.gov/geocoder/locations/onelineaddress?address=98+Central+Ave%2C+Brooklyn%2C+NY+11206&benchmark=9&format=json"
  # json = JSON.parse(response.body)
  # puts json
  #puts format_street_city("Jones Bill Ave")
