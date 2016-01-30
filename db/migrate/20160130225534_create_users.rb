class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password
      t.string :auth
      t.string :type
      t.timestamps null: false

      add_index :users, :username, unique: true
      add_index :users, :email, unique: true
    end
  end
end
