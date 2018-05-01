class Deck < ApplicationRecord
  has_many :deck_cards, dependent: :destroy
  has_many :cards, through: :deck_cards
end
