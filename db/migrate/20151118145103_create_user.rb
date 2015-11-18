class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, NOT NULL
      t.string :email, NOT NULL
      t.string :password_hash, NOT NULL
      t.timestamps
    end
  end
end
