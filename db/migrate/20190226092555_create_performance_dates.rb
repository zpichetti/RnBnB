class CreatePerformanceDates < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_dates do |t|
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
