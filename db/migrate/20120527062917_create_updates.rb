class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :comment

      t.timestamps
    end
  end
end
