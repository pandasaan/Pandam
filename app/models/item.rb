class Item < ApplicationRecord
  enum item_is_deleted: { active: 0, dead: 1 }

  attachment :image

  # belongs_to :artist
  # belongs_to :genre
  # belongs_to :label
  has_many :discs, dependent: :destroy
  has_many :tunes, :through => :discs
  has_many :carts
  has_many :oder_items

end
