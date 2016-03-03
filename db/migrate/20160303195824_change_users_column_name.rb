class ChangeUsersColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :clientId, :connection
  end
end
