class ModifyClient < ActiveRecord::Migration
  def up
  	change_table :clients do |t|
  		t.string :name
  	end
  end

  def down
  	change_table :clients do |t|
  		t.remove :name
  	end
  end
end
