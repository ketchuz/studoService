class RemoveThirdPartyIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :third_party_id, :string
  end
end
