class Schedule < ApplicationRecord
  self.table_name = "Schedules"

  belong_to :profiel
  belong_to :event

  validate :user_id, presence: true
  validate :event_id, presence: true
end
