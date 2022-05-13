class RemoveNameFromInvoice < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoices, :name
  end
end
