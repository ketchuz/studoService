class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :num_tries
      t.integer :num_correct
      t.float :efficiency_percentage
      t.belongs_to :scorable, polymorphic: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :scores, [:scorable_id, :scorable_type]
  end
end
