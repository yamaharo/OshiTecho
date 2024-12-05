class Profiel < ApplicationRecord
  self.table_name = "Profiels"

  belongs_to :prefecture

  has_many :bringing_set
  has_many :comment
  has_many :event_remark
  has_many :like
  has_many :memory
  has_many :my_oshi
  has_many :schedule

  validates :user_id, presence: true
  validates :name, presence: true
end
