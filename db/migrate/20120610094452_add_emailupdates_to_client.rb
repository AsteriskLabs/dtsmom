class AddEmailupdatesToClient < ActiveRecord::Migration
  def change
    add_column :clients, :email_updates, :boolean
  end
end
