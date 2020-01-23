class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :email, :string
    add_column :users, :address, :string
    add_column :users, :is_admin, :boolean
  end
end
