class AddUserIdToQnas < ActiveRecord::Migration
  def change
      add_reference :qnas, :user, index: true, foreign_key: true
  
  end
end
