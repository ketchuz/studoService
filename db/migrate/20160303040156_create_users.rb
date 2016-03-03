class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :clientId
      t.string :token
      t.string :third_party_id

      t.timestamps null: false
    end
  end
end
