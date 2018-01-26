class Booster < ApplicationRecord
  belongs_to :card_set, optional: true

  has_many :cards, dependent: :destroy
end
