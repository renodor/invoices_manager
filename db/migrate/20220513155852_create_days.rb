class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.date :date, null: false
      t.boolean :worked, default: true
      t.string :comment
      t.references :invoice, foreign_key: true, null: false
      t.timestamps
    end
  end
end
