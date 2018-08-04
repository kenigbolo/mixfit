class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :vitamin_c
      t.integer :vitamin_d3
      t.integer :iron
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
