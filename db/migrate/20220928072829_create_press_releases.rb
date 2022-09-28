class CreatePressReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :press_releases do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
