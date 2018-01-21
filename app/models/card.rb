class Card < ApplicationRecord
  belongs_to :booster, optional: true

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
      power toughness loyalty rulings image_url set set_name
    ]
  end
end
