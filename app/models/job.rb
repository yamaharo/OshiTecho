class Job < ApplicationRecord
  self.table_name = "Jobs"

  has_many :oshi

  validates :job_id, presence: true
  validates :name, presence: true
end
