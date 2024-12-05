class EventRemark < ApplicationRecord
  self.table_name = "Event_Remarks"

  belong_to :profiel
  belong_to :event

  validate :event_id, presence: true
  validate :user_id, presence: true
end
