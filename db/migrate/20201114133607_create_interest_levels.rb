class CreateInterestLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :interest_levels do |t|

      t.timestamps
    end
  end
end
