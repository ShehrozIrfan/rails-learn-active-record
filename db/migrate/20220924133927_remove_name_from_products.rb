class RemoveNameFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :name
  end
end
