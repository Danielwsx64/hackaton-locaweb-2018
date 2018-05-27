class ScheduleTask < ApplicationRecord
  belongs_to :schedule
  belongs_to :service
end
