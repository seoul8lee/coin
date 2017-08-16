class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :study_name
      t.text :study_time
      t.text :study_content
      t.string :study_pay
      t.integer :study_max
      t.date :study_due
      t.string :teacher_img
      t.text :teacher_intro
      t.boolean :study_pass
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
