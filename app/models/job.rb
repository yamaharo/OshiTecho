class Job < ApplicationRecord
  self.table_name = "Jobs"

  has_many :oshi

  validate :job_id, presence: true
  validate :name, presence: true
end
