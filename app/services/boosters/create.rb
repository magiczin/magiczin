module Boosters
  class Create
    attr_reader :set_code, :set_id, :draft_id

    def initialize(set_id, draft_id = nil)
      @set_id = set_id
      @draft_id = draft_id
      @set_code = find_set_code
    end

    def perform
      fetch_cards_from_api.map do |card|
        next if basic_land?(card)
        create_card(card)
      end 
      booster
    end

    private

    def booster
      @booster ||= Booster.create(card_set_id: set_id, draft_id: draft_id)
    end

    def find_set_code
      CardSet.find(set_id).code
    end

    def fetch_cards_from_api
      MTG::Set.generate_booster(set_code)
    end

    def basic_land?(card)
      card.type.include?("Basic") && card.type.include?("Land")
    end

    def create_card(card)
      new_card = Card.build_from_api_card(card)
      new_card.booster_id = booster.id
      new_card.save
    end
  end
end
