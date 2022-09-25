require_relative '20220924140558_create_users'

class RevertCreateUsers < ActiveRecord::Migration[5.2]
  def change
    revert CreateUsers
  end
end
