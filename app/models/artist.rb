class Artist < ApplicationRecord
  has_many :items

  validate :artist_name, presence: true
end
