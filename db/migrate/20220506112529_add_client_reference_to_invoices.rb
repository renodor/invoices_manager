class AddClientReferenceToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_reference :invoices, :client, foreign_key: true
  end
end
