class BringingSet < ApplicationRecord
    self.table_name = "BringingSet"

    belongs_to :profiel

    has_many :bringing_bringing_set

    validates :bringing_set_id, presence: true
    validates :name, presence: true
    validates :user_id, presence: true
end
