class RemoveRemoteFromListing < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :remote_ok
  end
end
