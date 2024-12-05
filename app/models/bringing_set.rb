class BringingSet < ApplicationRecord
    self.table_name = "BringingSet"

    belong_to :profiel

    has_many :bringing_bringing_set

    validate :bringing_set_id, presence: true
    validate :name, presence: true
    validate :user_id, presence: true
end
