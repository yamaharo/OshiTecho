class Event < ApplicationRecord
  self.table_name = "Events"

  belongs_to :prefecture
  belongs_to :event_category

  has_many :event_remark
  has_many :event_cast
  has_many :memory
  has_many :schedule

  validates :event_id, presence: true
  validates :name, presence: true
  validates :event_category_id, presence: true
  validates :creator_type, presence: true
  validates :hold_year_start, presence: true
  validates :hold_month_start, presence: true
  validates :hold_day_start, presence: true
  validates :hold_month_start, presence: true
  validates :hold_month_start, presence: true
end
