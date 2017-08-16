class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.string :student_name
      t.references :user, index: true, foreign_key: true
      t.references :study, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
