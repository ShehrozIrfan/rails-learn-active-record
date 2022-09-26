class AddPrefixToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :prefix, :string
  end
end
