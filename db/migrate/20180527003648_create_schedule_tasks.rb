class CreateScheduleTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_tasks do |t|
      t.belongs_to :schedule, index: true
      t.belongs_to :service, index: true

      t.timestamps
    end
  end
end
