
class RecipesController < ApplicationController
  def index
    @input = params[:keyword]
    if @input.nil? then @input = 'chocolate' end

    @recipes = Recipe.for(@input)
  end
end
