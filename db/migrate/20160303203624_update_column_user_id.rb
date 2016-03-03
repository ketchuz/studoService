class UpdateColumnUserId < ActiveRecord::Migration
  def change
  	change_column :users, :user_id, :bigint
  end
end
