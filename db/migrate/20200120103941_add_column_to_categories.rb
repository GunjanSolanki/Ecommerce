class AddColumnToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :category, :string
  end
end
