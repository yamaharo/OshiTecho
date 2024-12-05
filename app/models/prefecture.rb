class Prefecture < ApplicationRecord
  self.table_name = "Prefectures"

  has_many :access_cost
  has_many :event
  has_many :profiel

  validates :prefecture_id, presence: true
  validates :name, presence: true
end
