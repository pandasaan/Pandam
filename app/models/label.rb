class Label < ApplicationRecord
  has_many :items

  validates :label, presence: true
end
