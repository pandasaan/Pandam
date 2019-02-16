class Disc < ApplicationRecord
  belongs_to :item

  has_many :tunes

  validates :disc_name, presence: true
end
