class AddRestockedAtToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :restocked_at, :integer
  end
end
