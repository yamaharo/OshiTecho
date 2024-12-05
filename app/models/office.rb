class Office < ApplicationRecord
  self.table_name = "Offices"

  has_many :affilation
  has_many :oshi

  validate :office_id, presence: true
  validate :name, presence: true
  validate :sort, presence: true
end
