class BringingBringingSet < ApplicationRecord
  self.table_name = "Bringings_Bringing_Sets"

  belongs_to :bringing
  belongs_to :bringing_set

  validates :bringing_id, presence: true
  validates :bringing_set_id, presence: true
end
