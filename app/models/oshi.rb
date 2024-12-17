class Oshi < ApplicationRecord
  self.table_name = "Oshis"

  belongs_to :job

  has_many :affilation
  has_many :event_cast
  has_many :my_oshi

  validates :oshi_id, presence: true
  validates :name, presence: true
end
