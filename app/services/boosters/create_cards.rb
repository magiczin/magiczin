module Boosters
  class CreateCards
    def self.perform(set_code, booster)
      [].tap do |cards|
        Fetch.perform(set_code).map do |card|
          next if basic_land?(card)
          cards << Card.create_from_mtg_card(card, booster)
        end 
      end
    end

    def self.basic_land?(card)
      card.type.include?("Basic") && card.type.include?("Land")
    end
  end
end
