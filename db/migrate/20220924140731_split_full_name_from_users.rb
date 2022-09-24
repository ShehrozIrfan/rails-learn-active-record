class SplitFullNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        add_column :users, :first_name, :string
        add_column :users, :last_name, :string

        User.all.each do |u|
          u.first_name, u.last_name = u.full_name.split(' ')
          u.save
        end

        remove_column :users, :full_name, :string
      end

      dir.down do
        add_column :users, :full_name, :string

        User.all.each do |u|
          u.full_name = "#{u.first_name} #{u.last_name}"
          u.save
        end

        remove_column :users, :first_name, :string
        remove_column :users, :last_name, :string
      end
    end
  end
end
