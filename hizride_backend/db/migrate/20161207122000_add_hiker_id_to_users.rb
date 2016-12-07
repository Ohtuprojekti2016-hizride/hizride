class AddHikerIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hiker_id, :int
  end
end
