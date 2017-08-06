class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string:name
      t.float:coor_lat
      t.float:coor_long
      t.timestamps null: false
    end
  end
end
