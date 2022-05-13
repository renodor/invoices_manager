class AddNullConstraintToInvoiceUserAndClient < ActiveRecord::Migration[7.0]
  def change
    change_column_null :invoices, :user_id, false
    change_column_null :invoices, :client_id, false
  end
end
