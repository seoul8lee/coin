class AddUserIdToOfflines < ActiveRecord::Migration
  def change
     add_reference :offlines, :user, index: true, foreign_key: true
  
  end
end
