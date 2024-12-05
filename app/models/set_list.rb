class SetList < ApplicationRecord
  self.table_name = "Set_Lists"

  belongs_to :music

  validates :set_list_id, presence: true
  validates :music_id, presence: true
  validates :sort, presence: true
end
