class AddDateToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :start, :date
    add_column :bookings, :end, :date
  end
end
