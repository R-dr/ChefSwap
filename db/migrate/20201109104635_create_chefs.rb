# frozen_string_literal: true

class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.references :user, null: false, foreign_key: true
      t.text :bio

      t.timestamps
    end
  end
end
