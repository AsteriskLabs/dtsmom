class ModifyOrder < ActiveRecord::Migration
  def up
  	change_table :orders do |t|
  		t.remove :status
  	end
  end

  def down
  	change_table :orders do |t|
  		t.string :status
  	end
  end
end
