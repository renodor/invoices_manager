class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :address1
      t.string :address2
      t.string :zipcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
