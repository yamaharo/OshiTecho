class Schedule < ApplicationRecord
  self.table_name = "Schedules"

  belongs_to :profiel
  belongs_to :event

  validates :user_id, presence: true
  validates :event_id, presence: true
end
