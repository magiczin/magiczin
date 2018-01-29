class Sealed < ApplicationRecord
  has_many :card_set
  has_many :cards, dependent: :destroy

  def ordered_cards
    cards.order(:colors, :cmc, :name)
  end
end
