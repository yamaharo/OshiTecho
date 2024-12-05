class MyOshi < ApplicationRecord
  self.table_name = "My_Oshis"

  belongs_to :profiel
  belongs_to :oshi

  validates :user_id, presence: true
  validates :oshi_id, presence: true
end
