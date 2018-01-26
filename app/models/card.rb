class Card < ApplicationRecord
  MULTIVERSE_CARD_BASE_URL = "http://gatherer.wizards.com/Pages/Card/Details.aspx".freeze

  belongs_to :booster, optional: true
  belongs_to :sealed, optional: true

  def self.create_from_mtg_card(card, booster)
    booster.cards.build.tap do |new_card|
      attributes_from_mtg_card.map do |attr|
        attribute = card.send(attr)
        new_card.send("#{attr}=", attribute)
      end
      new_card.card_type = card.type
      new_card.save
    end
  end

  def self.attributes_from_mtg_card
    %i[
      name mana_cost cmc colors supertypes subtypes rarity text flavor
      power toughness loyalty rulings image_url set set_name multiverse_id
    ]
  end

  # @todo Move to presenter
  def multiverse_url
    "#{MULTIVERSE_CARD_BASE_URL}?multiverseid=#{multiverse_id}"
  end
end
