class ChangeIntegerLimitInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phone_number, :integer
  end
end
