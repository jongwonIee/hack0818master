class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer:category_id
      t.integer :user_id
      t.integer :type_id
      t.string :title
      t.string :name
      t.text :price
      t.text :date
      t.text :money
      t.text :reason
      t.text :content

      t.timestamps null: false
    end
  end
end