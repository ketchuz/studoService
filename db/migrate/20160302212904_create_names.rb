class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :last_name
      t.string :token
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
