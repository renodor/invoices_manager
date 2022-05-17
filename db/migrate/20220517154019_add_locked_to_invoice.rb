class AddLockedToInvoice < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :locked, :boolean, default: false
  end
end
