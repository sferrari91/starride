class CreateSpaceships < ActiveRecord::Migration[7.0]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :planet
      t.text :description
      t.decimal :price_per_day
      t.integer :number_of_passanger
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
