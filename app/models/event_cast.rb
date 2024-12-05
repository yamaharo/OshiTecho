class EventCast < ApplicationRecord
  self.table_name = "Event_Casts"

  belongs_to :event
  belongs_to :oshi

  validates :event_id, presence: true
  validates :oshi_id, presence: true
end
