## Assignment 5

Grade: A

## Details

```
RecipesController
  has an index action (REQUIREMENT 2)
  checks if request param 'keyword' was passed in (REQUIREMENT 3)
  renders :index template (DEFAULT)
  uses default value = chocolate (REQUIREMENT 4)

Recipe
  implements 'for' method (REQUIREMENT 5)
  takes a keyword to query (REQUIREMENT 5)
  queries the RecipePuppy API (REQUIREMENT 5)

routes to recipes
  routes recipes/index to recipes#index (REQUIREMENT 9)
  routes :root to recipes#index (REQUIREMENT 9)

RecipesIntegration
  GET /recipes/index
    gets recipes index path
  goes to the recipe's URL
    when the title is clicked (REQUIREMENT 7)
    when the thumbnail is clicked (REQUIREMENT 7)
    sanitizes recipe title (REQUIREMENT 8)

Finished in 2.74 seconds

Randomized with seed 36269
```

## Comments

Great work!

Just as an administrative detail, for future assignments, can you have the application in the root directory of your repo rather than in its own `facecook` directory?

