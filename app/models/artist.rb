class Artist < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :artist_name, presence: true
end
