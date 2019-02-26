class Label < ApplicationRecord
  has_many :items, dependent: :destroy

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
end
