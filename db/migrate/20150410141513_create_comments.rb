class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :recipe
      t.text :content, null: false

      t.timestamps
    end
    add_index(:comments, :user_id)
    add_index(:comments, :recipe_id)
  end
end
