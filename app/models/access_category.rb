class AccessCategory < ApplicationRecord
  self.table_name = "Access_Categories"

  has_many :access_cost
end
