module Sealed
  class Create
    def self.perform(set_code)
      Hash.new(0).tap do |cards_hash|
        6.times do
          booster = Booster.create
          Boosters::CreateCards.perform(set_code, booster)
          booster.cards.map do |card|
            cards_hash[card.name] += 1
          end 
        end
      end
    end
  end
end
