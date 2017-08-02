class CreateQnaReplies < ActiveRecord::Migration
  def change
    create_table :qna_replies do |t|
      t.string :qna_reply_user
      t.text :content
      t.text :code_content
      t.string :img
      t.references :qna, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
