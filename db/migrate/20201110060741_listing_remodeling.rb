class ListingRemodeling < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :price,:integer
    add_column :listings, :date_available, :date 
    add_column :listings, :booked, :boolean
  end
end
