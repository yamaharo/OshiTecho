class BringingBringingSet < ApplicationRecord
  self.table_name = "Bringings_Bringing_Sets"

  belong_to :bringing
  belong_to :bringing_set

  validate :bringing_id, presence: true
  validate :bringing_set_id, presence: true
end
