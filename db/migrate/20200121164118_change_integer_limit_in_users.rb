class ChangeIntegerLimitInUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phone_number, :bigint
  end
end
