class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :num_people
      t.datetime :booking_time

      t.timestamps
    end
  end
end
