class Tune < ApplicationRecord
  belongs_to :disc

  validates :disc_name, presence: true
  validates :index, presence:true 
end
