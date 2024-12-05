class Office < ApplicationRecord
  self.table_name = "Offices"

  has_many :affilation
  has_many :oshi

  validates :office_id, presence: true
  validates :name, presence: true
  validates :sort, presence: true
end
