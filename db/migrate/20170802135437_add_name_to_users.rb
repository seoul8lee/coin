class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :string
    add_column :users, :phone, :string, unique: true
    add_column :users, :part, :string
    add_column :users, :nickname, :string, unique: true
  
  
  end
end
