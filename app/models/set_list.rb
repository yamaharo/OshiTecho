class SetList < ApplicationRecord
  self.table_name = "Set_Lists"

  validate :set_list_id, presence: true
  validate :music_id, presence: true
  validate :sort, presence: true
end
