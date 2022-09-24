class DropEmployees < ActiveRecord::Migration[5.2]
  def change
    drop_table :employees do |t|
      t.string :name
      t.integer :age
      t.timestamps
    end
  end
end
