class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :category
      t.string :team_name
      t.text :content
      t.boolean :secret
    

      t.timestamps null: false
    end
  end
end
