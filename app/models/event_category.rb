class EventCategory < ApplicationRecord
  self.table_name = "Event_Categories"

  has_many :event

  validate :event_category_id, presence: true
  validate :name, presence: true
  validate :sort, presence: true
end
