class MyOshi < ApplicationRecord
  self.table_name = "My_Oshis"

  belong_to :profiel
  belong_to :oshi

  validate :user_id, presence: true
  validate :oshi_id, presence: true
end
