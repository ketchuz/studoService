class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.string :german
      t.string :english
      t.string :spanish
      t.string :type
      t.string :past
      t.string :future
      t.string :past_verb_helper

      t.timestamps null: false
    end
  end
end
