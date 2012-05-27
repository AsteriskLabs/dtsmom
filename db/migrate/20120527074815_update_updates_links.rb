class UpdateUpdatesLinks < ActiveRecord::Migration
  def up
  	change_table :updates do |t|
  		t.integer :order_id
  		t.integer :admin_id
  	end
  end

  def down
  	change_table :updates do |t|
  		t.remove :order_id, :admin_id
  	end
  end
end
