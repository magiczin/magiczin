module Boosters
  class Fetch
    def self.perform(set_code)
      MTG::Set.generate_booster(set_code) 
    end
  end
end
