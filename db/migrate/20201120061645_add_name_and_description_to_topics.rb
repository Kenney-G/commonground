class AddNameAndDescriptionToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :name, :string
    add_column :topics, :description, :text
  end
end
