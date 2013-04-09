class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :slug
      t.text :bag
      t.integer :user_id
      t.integer :items_count

      t.timestamps
    end
  end
end
