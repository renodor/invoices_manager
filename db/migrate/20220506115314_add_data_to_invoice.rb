class AddDataToInvoice < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :number, :string, null: false
    add_column :invoices, :date, :datetime, null: false
    add_column :invoices, :title, :string
  end
end
