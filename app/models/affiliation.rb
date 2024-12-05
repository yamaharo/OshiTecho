class Affiliation < ApplicationRecord
  self.table_name = "Affiliations"

  belong_to :office
  belong_to :oshi

  validate :office_id, presence: true
  validate :oshi_id, presence: true
end
