class AddUserIdToQnaReplies < ActiveRecord::Migration
  def change
    add_reference :qna_replies, :user, index: true, foreign_key: true
  
  end
  
end
