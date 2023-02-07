class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :zip_code
      t.string :telephone
      t.string :email
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
