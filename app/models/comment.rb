class Comment < ApplicationRecord
  self.table_name = "Comments"

  belong_to :profiel
  belong_to :memory

  validate :comments_id, presence: true
  validate :memory_id, presence: true
  validate :user_id, presence: true
end
