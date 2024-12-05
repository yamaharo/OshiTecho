class Oshi < ApplicationRecord
  self.table_name = "Oshis"

  belong_to :office
  belong_to :job

  has_many :affilation
  has_many :event_cast
  has_many :my_oshi

  validate :oshi_id, presence: true
  validate :name, presence: true
end
