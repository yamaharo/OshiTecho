class Like < ApplicationRecord
  self.table_name = "Likes"

  belongs_to :profiel
  belongs_to :memory

  validates :like_id, presence: true
  validates :memory_id, presence: true
  validates :user_id, presence: true
end
