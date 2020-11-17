class AddChefsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :chef, null: false, foreign_key: true
  end
end
