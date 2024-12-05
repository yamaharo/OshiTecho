class Comment < ApplicationRecord
  self.table_name = "Comments"

  belongs_to :profiel
  belongs_to :memory

  validates :comments_id, presence: true
  validates :memory_id, presence: true
  validates :user_id, presence: true
end
