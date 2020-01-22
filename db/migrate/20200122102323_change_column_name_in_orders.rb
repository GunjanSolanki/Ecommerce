class ChangeColumnNameInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :order_status, 'integer USING CAST(order_status AS integer)'
  end
end
