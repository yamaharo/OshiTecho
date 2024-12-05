class Affiliation < ApplicationRecord
  self.table_name = "Affiliations"

  belongs_to :office
  belongs_to :oshi

  validates :office_id, presence: true
  validates :oshi_id, presence: true
end
