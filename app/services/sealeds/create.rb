module Sealeds
  class Create
    def self.perform(sets, sealed)
      Hash.new(0).tap do |cards_hash|
        sets.map do |set_id|
          booster = Boosters::Create.new(set_id).perform
          booster.cards.map do |card|
            sealed.cards << card
            cards_hash[card.name] += 1
          end 
        end
      end
    end
  end
end
