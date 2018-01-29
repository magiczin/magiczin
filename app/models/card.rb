class Card < ApplicationRecord
  MULTIVERSE_CARD_BASE_URL = "http://gatherer.wizards.com/Pages/Card/Details.aspx".freeze
  ATTRIBUTES_FROM_API_CARD = %i[
    name mana_cost cmc colors supertypes subtypes rarity text flavor
    power toughness loyalty rulings image_url set set_name multiverse_id
  ].freeze

  belongs_to :booster, optional: true
  belongs_to :sealed, optional: true

  def self.build_from_api_card(template)
    Card.new.tap do |new_card|
      ATTRIBUTES_FROM_API_CARD.map do |attr|
        attribute = template.send(attr)
        new_card.send("#{attr}=", attribute)
      end
      new_card.card_type = template.type
    end
  end

  # @todo Move to presenter
  def multiverse_url
    "#{MULTIVERSE_CARD_BASE_URL}?multiverseid=#{multiverse_id}"
  end
end
