class AddUserattributeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :sex, :string
    add_column :users, :birth, :string
    add_column :users, :phone, :string
    add_column :users, :howmany, :integer
    add_column :users, :admin, :boolean
  end
end
