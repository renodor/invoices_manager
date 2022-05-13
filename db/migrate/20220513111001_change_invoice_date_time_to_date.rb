class ChangeInvoiceDateTimeToDate < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :date, :date
  end
end
