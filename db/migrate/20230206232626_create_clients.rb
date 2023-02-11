class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :zip_code, null: false
      t.string :telephone, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
