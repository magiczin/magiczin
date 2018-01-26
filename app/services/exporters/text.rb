module Exporters
  class Text
    def self.perform(cards)
      Hash.new(0).tap do |cards_hash|
        cards.map do |card|
          cards_hash[card.name] += 1
        end
      end
    end
  end
end
