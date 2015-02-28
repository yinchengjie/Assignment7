require 'httparty'

class Recipe
  include HTTParty

  base_uri 'http://www.recipepuppy.com'
  default_params output: 'json', onlyImages: 1
  format :json

  def self.for(search)
    get('/api/', query: {q: search})
  end

end

puts Recipe.for "chocolate"
puts Recipe.for "apple pie"