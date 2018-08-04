# Recipe Service
class RecipeService
  attr_reader :user, :food_intake, :activity_level, :vitamin_c, :vitamin_d3, :iron

  def initialize(user)
    @user = user
    @food_intake = user.food_intakes.order('updated_at').last
    @activity_level = user.activity_levels.order('updated_at').last
    @vitamin_c = 10 - (@food_intake.vitamin_c - @activity_level.vitamin_c)
    @vitamin_d3 = 10 - (@food_intake.vitamin_d3 - @activity_level.vitamin_d3)
    @iron = 10 - (@food_intake.iron - @activity_level.iron)
  end

  def generate_recipe
    recipe = build_recipe
    if recipe.save!
      build_recipe_json(recipe)
      UserService::Result.new(user: @recipe, success: true, errors: nil)
    else
      UserService::Result.new(user: nil, success: false, errors: recipe.errors)
    end
  end

  def user_recipes
    return [] unless user.recipes
    user.recipes.map { |recipe| build_recipe_json(recipe) }
  end

  private

  def build_recipe
    user.recipes.new(
      vitamin_c: vitamin_c, vitamin_d3: vitamin_d3, iron: iron,
      food_intake: food_intake, activity_level: activity_level
    )
  end

  def build_recipe_json(recipe)
    @recipe = recipe.to_builder.target!
  end
end
