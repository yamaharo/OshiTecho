class Like < ApplicationRecord
  self.table_name = "Likes"

  belong_to :profiel
  belong_to :memory

  validate :like_id, presence: true
  validate :memory_id, presence: true
  validate :user_id, presence: true
end
