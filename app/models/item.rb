class Item < ApplicationRecord
  enum item_is_deleted: { active: 0, dead: 1 }

  belongs_to :artist
  belongs_to :genre
  belongs_to :label
  has_many :discs, dependent: :destroy
  has_many :tunes, through: :discs
  has_many :carts
  has_many :items, through: :carts
  has_many :oder_items

  validates :title, presence: true
  validates :artist_id, presence: true
  validates :image_id, presence: true
  validates :genre_id, presence: true
  validates :label, presence: true
  validates :price, presence: true
  validates :stock, presence: true
end 
