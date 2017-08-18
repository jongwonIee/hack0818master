class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.integer :user_id
      t.integer:category_id
      t.integer :type_id
      
      t.string :title
      t.string :name
      t.integer :price
      t.text :date
      t.integer :money
      t.text :reason
      t.text :content
      
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end