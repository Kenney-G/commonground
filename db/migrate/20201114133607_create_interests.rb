class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.belongs_to :user
      t.belongs_to :topic
      #user submittable attribute
      t.string :name, :null => false
      #Ex:- :null => false
      t.text :description
      t.timestamps
    end
  end
end
