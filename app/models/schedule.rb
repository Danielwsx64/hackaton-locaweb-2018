class Schedule < ApplicationRecord
  belongs_to :client
  has_many :schedule_tasks
  has_many :services, through: :schedule_tasks
end
