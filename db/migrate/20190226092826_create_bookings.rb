class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :profile, foreign_key: true
      t.references :performance, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
