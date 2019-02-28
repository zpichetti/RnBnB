class AddHourPriceToPerformances < ActiveRecord::Migration[5.2]
  def change
    add_column :performances, :hour_price, :integer
  end
end
