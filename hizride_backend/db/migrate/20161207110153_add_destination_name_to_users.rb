class AddDestinationNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :destination_name, :string
  end
end
