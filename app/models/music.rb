class Music < ApplicationRecord
  self.table_name = "Musics"

  has_many :set_list

  validates :music_id, presence: true
  validates :name, presence: true
end
