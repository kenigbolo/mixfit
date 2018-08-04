class AddActivityLevelToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :activity_level, foreign_key: true
  end
end
