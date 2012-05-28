class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :status
      t.string :description
      t.integer :order_id

      t.timestamps
    end
  end
end
