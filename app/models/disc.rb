class Disc < ApplicationRecord
  belongs_to :item, inverse_of: :discs
  has_many :tunes, dependent: :destroy
  accepts_nested_attributes_for :tunes, reject_if: :all_blank, allow_destroy: true
end
