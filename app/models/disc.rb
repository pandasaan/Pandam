class Disc < ApplicationRecord
  belongs_to :item
  has_many :tunes
  # accepts_nested_attributes_for :tunes, reject_if: :all_blank, allow_destroy: true
end
