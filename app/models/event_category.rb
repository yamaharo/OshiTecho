class EventCategory < ApplicationRecord
  self.table_name = "Event_Categories"

  has_many :event

  validates :event_category_id, presence: true
  validates :name, presence: true
  validates :sort, presence: true
end
