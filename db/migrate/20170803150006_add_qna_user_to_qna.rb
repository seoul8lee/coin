class AddQnaUserToQna < ActiveRecord::Migration
  def change
    add_column :qnas, :qna_user, :string
  end
end
