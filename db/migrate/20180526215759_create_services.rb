class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.string :description
      t.float :duration
      t.float :price

      t.timestamps
    end
  end
end
