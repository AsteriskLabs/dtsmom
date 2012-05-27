class UpdateOrdersLinks < ActiveRecord::Migration
  def up
  	change_table :orders do |t|
  		t.integer :client_id
  		t.integer :admin_id
  	end
  end

  def down
  	change_table :orders do |t|
  		t.remove :client_id, :admin_id
  	end
  end
end
