class EventCast < ApplicationRecord
  self.table_name = "Event_Casts"

  belong_to :event
  belong_to :oshi

  validate :event_id, presence: true
  validate :oshi_id, presence: true
end
