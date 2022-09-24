class RemoveRestockedAtFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :restocked_at, :datetime
  end
end
