class CreateQnas < ActiveRecord::Migration
  def change
    create_table :qnas do |t|
      t.string :title
      t.string :category
      t.text :content
      t.text :code_content
      t.string :img
    
      t.timestamps null: false
    end
  end
end
