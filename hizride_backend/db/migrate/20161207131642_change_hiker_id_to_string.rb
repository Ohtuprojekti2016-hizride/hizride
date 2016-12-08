class ChangeHikerIdToString < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :hiker_id, :string
  end
end
