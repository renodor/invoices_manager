class AddDeletedAtToInvoice < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :deleted_at, :datetime
  end
end
