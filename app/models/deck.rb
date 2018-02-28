class Deck < ApplicationRecord
  def main_cards
    @main_cards ||= Card.where(id: main_cards_ids)
  end

  def sideboard_cards
    @sideboard_cards ||= Card.where(id: sideboard_cards_ids)
  end
end
