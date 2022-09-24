class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name, :string
    add_column :products, :description, :text
    add_column :products, :inventory, :integer
    add_column :products, :price, :decimal, precision: 7, scale: 2
    add_column :products, :restocked_at, :datetime
  end
end
