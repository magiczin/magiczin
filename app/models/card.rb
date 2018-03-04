class Card < ApplicationRecord
  include PgSearch

  MULTIVERSE_CARD_BASE_URL = "http://gatherer.wizards.com/Pages/Card/Details.aspx".freeze
  ATTRIBUTES_FROM_API_CARD = %i[
    name mana_cost cmc colors supertypes subtypes rarity text flavor
    power toughness loyalty rulings image_url set set_name multiverse_id
  ].freeze
  CARD_COLORS = %w[Black Blue Green Red White].freeze

  belongs_to :booster, optional: true
  belongs_to :sealed, optional: true

  pg_search_scope :card_type_full_text_search, against: :card_type,
                                               using: { tsearch: { prefix: true } },
                                               order_within_rank: "cards.colors"
  pg_search_scope :full_text_search,
                  against: {
                    name: "A",
                    subtypes: "B",
                    text: "C"
                  },
                  using: { tsearch: { prefix: true } },
                  order_within_rank: "cards.colors"

  def self.build_from_api_card(template)
    Card.new.tap do |new_card|
      ATTRIBUTES_FROM_API_CARD.map do |attr|
        attribute = template.send(attr)
        new_card.send("#{attr}=", attribute)
      end
      new_card.card_type = template.type
    end
  end
end
