class ChangeIntegerLimitInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :contact, :bigint
  end
end
