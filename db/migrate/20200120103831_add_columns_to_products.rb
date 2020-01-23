class AddColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :description, :string
    add_column :products, :price, :decimal
    add_column :products, :quantity, :integer
  end
end
