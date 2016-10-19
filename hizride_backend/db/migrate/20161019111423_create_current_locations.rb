class CreateCurrentLocations < ActiveRecord::Migration
  def change
    create_table :current_locations do |t|
      t.string :lat
      t.string :lng
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
