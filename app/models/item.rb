class Item < ApplicationRecord
  enum item_is_deleted: { active: 0, dead: 1 }

  attachment :image

  belongs_to :artist, optional: true
  belongs_to :genre, optional: true
  belongs_to :label, optional: true
  has_many :discs, dependent: :destroy
  has_many :tunes, through: :discs
  has_many :carts
  has_many :users, through: :carts
  has_many :oder_items

  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :artist_id, presence: true
  validates :image_id, presence: true
  validates :genre_id, presence: true
  validates :label_id, presence: true
  validates :price, presence: true
  validates :stock, presence: true

end