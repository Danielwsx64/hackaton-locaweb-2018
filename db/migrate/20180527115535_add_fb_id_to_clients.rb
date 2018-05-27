class AddFbIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :fb_id, :string
  end
end
