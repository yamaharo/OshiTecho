class Memory < ApplicationRecord
  self.table_name = "Memories"

  has_many :event
  has_many :profiel

  validates :memory_id, presence: true
  validates :event_id, presence: true
  validates :user_id, presence: true
end
