require 'httparty'

class Recipe
  include HTTParty

  base_uri 'www.recipepuppy.com/api'
  default_params output: 'json', onlyImages: 1
  format :json

  def self.for(q)
    get("/", query: {q: q})["results"]
  end
end

puts Recipe.for("chocolate")
puts Recipe.for("apple pie")