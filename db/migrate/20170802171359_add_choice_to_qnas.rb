class AddChoiceToQnas < ActiveRecord::Migration
  def change
    add_column :qnas, :choice, :integer
  end
end
