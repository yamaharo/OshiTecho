class Bringing < ApplicationRecord
  self.table_name = "Bringing_Sets"

  belongs_to :profiel

  has_many :bringing_bringing_set

  validates :bringing_id, presence: true
  validates :name, presence: true
  validates :user_type, presence: true
end
