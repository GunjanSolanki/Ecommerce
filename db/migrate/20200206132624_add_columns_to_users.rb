class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :contact, :integer
    add_column :users, :gender, :string
  end
end
