class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :date_start
      t.datetime :date_end
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
