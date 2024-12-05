class AccessCost < ApplicationRecord
  self.table_name = "Access_Costs"

  belong_to :prefecture
  belong_to :access_category

  validates :prefecture_id_from, presence: true
  validates :prefecture_id_to, presence: true
  validates :access_id, presence: true
  validates :cost, presence: true
end
