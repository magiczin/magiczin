module Boosters
  class CreateCards
    def self.perform(set_code, booster)
      [].tap do |cards|
        Fetch.perform(set_code).map do |card|
          cards << Card.create_from_mtg_card(card, booster)
        end 
      end
    end
  end
end
