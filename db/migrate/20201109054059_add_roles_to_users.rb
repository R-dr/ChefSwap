class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :client, :boolean, default: true
    add_column :users, :name, :string
    add_column :users, :chef, :boolean, default: false
  end
end
