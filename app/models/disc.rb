class Disc < ApplicationRecord
  belongs_to :item, optional: true
  has_many :tunes
  accepts_nested_attributes_for :item, reject_if: :all_blank, allow_destroy: true
end
