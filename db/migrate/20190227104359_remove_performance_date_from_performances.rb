class RemovePerformanceDateFromPerformances < ActiveRecord::Migration[5.2]
  def change
    remove_reference :performances, :performance_date, foreign_key: true
  end
end
