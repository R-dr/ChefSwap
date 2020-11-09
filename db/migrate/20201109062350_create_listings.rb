# frozen_string_literal: true

class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :job_type
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.boolean :remote_ok

      t.timestamps
    end
  end
end
