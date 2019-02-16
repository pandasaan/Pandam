class Shipment < ApplicationRecord
  belongs_to :user

  validates :shipment_name, presence: true
  validates :shipment_name_kana, presence: true
  validates :shipment_postal_code, presence: true
  validates :shipment_address, presence: true
  validates :user_id, presence: true
end
