class AddAdditionals < ActiveRecord::Migration[5.2]
  def change
    create_table :additionals do |t|
      t.integer :service_id
      t.integer :related_service_id

      t.timestamps
    end
  end
end
