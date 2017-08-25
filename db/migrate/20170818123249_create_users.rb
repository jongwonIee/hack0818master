class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    
      t.string :email
      t.string :password      
      t.string :name
      t.string :sex
      t.string :birth
      t.string :phone    
      t.string :howmany
      
      t.timestamps null: false
    end
  end
end
