require 'rest-client'
require 'json'
require 'pry'



# def get_reddit
#   response = RestClient.get 'https://www.reddit.com/.json'
#   json_response = JSON.parse(response)
#
#   binding.pry
# end
#
# get_reddit


# A Welcome message to show our uses
def welcome
  puts "Welcome to your library application"
end

# Ask them what term they want to search and then store
# whatever the user inputted into a variable to get returned
# from our method
def get_term
  puts "What do you want search for? "
  term = gets.chomp
end

# Here we make our network request, our request to the Google Books API
# We will go out to the Internet using the RestClient and it will store
# the response from the data inside of response. What we get back is a <RestClient::Response>
# We will use JSON.parse to take the response's body and convert it into
# a hash that Ruby can use
def search_for_term(term)
  response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q={#{term}}"
  json = JSON.parse(response.body)
  json
end

# Here we take the method from above and call it within this method
# We will store its results within in a variable `json`. From there we will
# make a new array of hashes where we just put in the information of `title`, `publisher`, `publishedDate`
# into it. And last but not least, we are gonna take it through the array and for **each** one
# we will display a set of information.
def display_books(term)
  json = search_for_term(term)

  books = json["items"].map do |book|
    {
      title: book["volumeInfo"]["title"],
      publisher: book["volumeInfo"]["publisher"],
      publishedDate: book["volumeInfo"]["publishedDate"]
    }
  end

  books.each do |book|
    puts "==============="
    puts "Book Title: #{book[:title]}"
    puts "Book Publisher: #{book[:publisher]}"
    puts "Book Published At: #{book[:publishedDate]}"
    puts "==============="
  end
end

welcome
term = get_term
display_books(term)
