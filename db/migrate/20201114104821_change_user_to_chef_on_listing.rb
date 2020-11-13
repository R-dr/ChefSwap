class ChangeUserToChefOnListing < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings,:chef,null: false,  foreign_key: true
    remove_column :listings, :user_id
  end
end
