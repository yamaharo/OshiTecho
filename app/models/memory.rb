class Memory < ApplicationRecord
  self.table_name = "Memories"

  has_many :event
  has_many :profiel

  validate :memory_id, presence: true
  validate :event_id, presence: true
  validate :user_id, presence: true
end
