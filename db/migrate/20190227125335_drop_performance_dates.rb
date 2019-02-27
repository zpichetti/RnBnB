class DropPerformanceDates < ActiveRecord::Migration[5.2]
  def change
    drop_table :performance_dates
  end
end
