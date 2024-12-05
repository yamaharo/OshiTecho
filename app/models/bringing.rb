class Bringing < ApplicationRecord
  self.table_name = "Bringing_Sets"

  belong_to :profiel

  has_many :bringing_bringing_set

  validate :bringing_id, presence: true
  validate :name, presence: true
  validate :user_type, presence: true
end
