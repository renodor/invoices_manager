class AddDataToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address1, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :website, :string
    add_column :users, :siren, :string
  end
end
