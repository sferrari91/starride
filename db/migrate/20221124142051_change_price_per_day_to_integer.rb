class ChangePricePerDayToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :spaceships, :price_per_day, :integer
  end
end
