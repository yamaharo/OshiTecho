class Music < ApplicationRecord
  self.table_name = "Musics"

  has_many :set_list

  validate :music_id, presence: true
  validate :name, presence: true
end
