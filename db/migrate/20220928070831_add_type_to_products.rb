class AddTypeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :type, :string

    reversible do |dir|
      dir.up do
        Product.update_all(type: "OnlinePurchase")
      end
    end
  end
end
