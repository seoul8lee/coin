class CreateOfflines < ActiveRecord::Migration
  def change
    create_table :offlines do |t|
      t.string :category
      t.string :team_name
      t.string :address
      t.string :name
      t.string :phone
      t.text :date
      t.text :content
    

      t.timestamps null: false
    end
  end
end
