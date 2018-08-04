class AddFoodIntakeToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :food_intake, foreign_key: true
  end
end
