class AddDescriptionToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :description, :text
  end
end
