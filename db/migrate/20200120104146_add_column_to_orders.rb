class AddColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :amount, :decimal
    add_reference :orders, :user, null: false, foreign_key: true
  end
end
