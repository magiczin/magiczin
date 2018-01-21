module Sealed
  class Create
    def self.perform(set_code)
      [].tap do |cards|
        6.times do
          booster = Booster.create

          Boosters::CreateCards.perform(set_code, booster)
          cards << booster.cards
        end
      end.flatten
    end
  end
end
