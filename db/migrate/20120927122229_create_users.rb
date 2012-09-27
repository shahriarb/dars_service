class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :token
      t.integer :confirmation_code
      t.boolean :confirmed

      t.timestamps
    end
  end
end
