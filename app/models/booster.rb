class Booster < ApplicationRecord
  belongs_to :card_set, optional: true
  belongs_to :draft, optional: true

  has_many :cards, dependent: :destroy
end
