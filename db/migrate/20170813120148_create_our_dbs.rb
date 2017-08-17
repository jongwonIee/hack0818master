class CreateOurDbs < ActiveRecord::Migration
  def change
    create_table :our_dbs do |t|
      t.float :coorlat
      t.float :coorlong
      t.string :name
      t.string :roadAddress
      t.string :tel
      t.string :location
      t.integer :type_id

      t.timestamps null: false
    end
  end
end
