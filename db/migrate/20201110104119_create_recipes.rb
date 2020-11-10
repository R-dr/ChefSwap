class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :chef, null: false, foreign_key: true
      t.string :title
      t.integer :cooktime
      t.text :body

      t.timestamps
    end
  end
end
