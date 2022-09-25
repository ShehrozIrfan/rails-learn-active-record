class AddStyleToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :style, foreign_key: true
  end
end
