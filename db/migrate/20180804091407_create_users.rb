class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.decimal :wieght
      t.decimal :height

      t.timestamps
    end
  end
end
