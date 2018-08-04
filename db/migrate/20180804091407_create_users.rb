class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.decimal :weight
      t.decimal :height
      t.decimal :bmi

      t.timestamps
    end
  end
end
