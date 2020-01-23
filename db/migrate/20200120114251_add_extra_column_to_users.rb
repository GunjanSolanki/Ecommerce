class AddExtraColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :password_digest, :string
  end
end
