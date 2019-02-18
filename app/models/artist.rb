class Artist < ApplicationRecord
  has_many :items
# <<<<<<< HEAD
  # accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
# =======

  validates :artist_name, presence: true
end
