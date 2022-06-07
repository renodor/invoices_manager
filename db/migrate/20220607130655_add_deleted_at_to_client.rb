class AddDeletedAtToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :deleted_at, :datetime
  end
end
