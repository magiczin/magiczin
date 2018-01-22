module Sealed
  class Create
    def self.perform(sets)
      Hash.new(0).tap do |cards_hash|
        sets.map do |set_code|
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
