class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
            #user submittable attributes
      t.integer :level
      t.string :name
      t.text :description
      
      t.timestamps
    end
  end
end
