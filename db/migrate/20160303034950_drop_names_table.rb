class DropNamesTable < ActiveRecord::Migration
  def change
  	drop_table :names
  end
end
