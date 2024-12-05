class Event < ApplicationRecord
  self.table_name = "Events"

  belong_to :prefecture
  belong_to :event_category

  has_many :event_remark
  has_many :event_cast
  has_many :memory
  has_many :schedule

  validate :event_id, presence: true
  validate :name, presence: true
  validate :event_category_id, presence: true
  validate :creator_type, presence: true
  validate :hold_year_start, presence: true
  validate :hold_month_start, presence: true
  validate :hold_day_start, presence: true
  validate :hold_month_start, presence: true
  validate :hold_month_start, presence: true
end
