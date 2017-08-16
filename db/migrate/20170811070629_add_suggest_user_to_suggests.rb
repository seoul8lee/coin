class AddSuggestUserToSuggests < ActiveRecord::Migration
  def change
    add_column :suggests, :suggest_user, :string
  end
end
