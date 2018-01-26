class Sealed < ApplicationRecord
  has_many :card_set
  has_many :cards, dependent: :destroy
end
