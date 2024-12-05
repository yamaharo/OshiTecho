class EventRemark < ApplicationRecord
  self.table_name = "Event_Remarks"

  belongs_to :profiel
  belongs_to :event

  validates :event_id, presence: true
  validates :user_id, presence: true
end
