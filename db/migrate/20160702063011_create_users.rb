class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.boolean :admin, default: false, null: false

      t.timestamps
    end
  end
end
