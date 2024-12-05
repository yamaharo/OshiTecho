class Prefecture < ApplicationRecord
  self.table_name = "Prefectures"

  has_many :access_cost
  has_many :event
  has_many :profiel

  validate :prefecture_id, presence: true
  validate :name, presence: true
end
