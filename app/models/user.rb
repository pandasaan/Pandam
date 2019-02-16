class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_is_deleted: { active: 0, dead: 1 }

  has_many :shipments, dependent: :destroy
  has_many :oders, dependent: :destroy
  has_many :carts, dependent: :destroy

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tell, presence: true
end
