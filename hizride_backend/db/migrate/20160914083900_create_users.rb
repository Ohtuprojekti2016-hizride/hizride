class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_id
      t.time :last_login

      t.timestamps null: false
    end
  end
end
