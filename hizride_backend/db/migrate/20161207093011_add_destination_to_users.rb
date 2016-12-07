class AddDestinationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :destination_lat, :string
    add_column :users, :destination_lng, :string
  end
end
