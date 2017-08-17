class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string:name
      t.float:coorlat
      t.float:coorlong
      t.timestamps null: false
    end
  end
end
