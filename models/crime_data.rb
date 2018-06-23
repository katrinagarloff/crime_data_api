require 'rest-client'
require 'json'
require 'pry'
require 'unirest'

class CrimeData

response = Unirest.get "https://jgentes-Crime-Data-v1.p.mashape.com/crime?enddate=9%2F25%2F2015&lat=37.757815&long=-122.5076392&startdate=9%2F19%2F2015"

end
