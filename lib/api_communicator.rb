require 'rest-client'
require 'json'
require 'pry'

def get_characters
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  JSON.parse(all_characters)
end

def get_film_api_array(character)
  character_data = get_characters
  character_data.map do |key, value|
    if key == "results"
      value.map do |element|
        element.map do |att, data|
          if att == "name" && data.downcase == character
            return element["films"]
          end
        end
      end
    end
  end
end


def film_info(character)
  film_info_array = []
  get_film_api_array(character).map do |url|
    movie_data = RestClient.get(url)
    film_info_array << JSON.parse(movie_data)
  end
  film_info_array
end

  ### iterate over the character hash to find the collection of `films` for the given
  ###   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def parse_character_movies(films_array)
  array = []
  films_array.map do |element|
    element.map do |att, value|
      #binding.pry
      if att == "title"
        array << value
      end
    end
  end
  puts array
end


def show_character_movies(character)
  #binding.pry
  films_array = film_info(character)
  #binding.pry
  parse_character_movies(films_array)
  #binding.pry
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
