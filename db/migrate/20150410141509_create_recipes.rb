class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.references :user
      t.text :ingredients, null: false
      t.text :instructions, null: false
      t.text :photo_url
      t.integer :vote_count

      t.timestamps
    end
    add_index(:recipes, :user_id)
  end
end
