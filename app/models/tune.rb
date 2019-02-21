class Tune < ApplicationRecord
  belongs_to :disc, inverse_of: :tunes

end
