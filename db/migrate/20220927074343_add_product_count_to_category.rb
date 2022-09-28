class AddProductCountToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :products_count, :integer, default: 0

    reversible do |dir|
      dir.up do
        Category.all do |category|
          count = category.products.size
          category.update_attribute(:products_count, count)
        end
      end
    end
  end
end
