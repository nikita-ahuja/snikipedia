class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, {null: false }
      t.string :password_hash

      t.timestamps
    end
  end
end
