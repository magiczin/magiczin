namespace :import do
  desc "Import all cards from a JSON file"
  task cards: :environment do
    sets.map do |_set_code, set|
      create_set(set)
      set["cards"].map do |card|
        create_card(card, set)
      end
    end
  end

  def sets
    @sets ||= JSON.parse(File.read("db/sets.json"))
  end

  def create_set(set)
    p "Creating set: #{set['name']}"

    attrs = %w[name code release_date block]
    attrs_hash = { "set_type" => set["type"] }
    populate_attributes(attrs_hash, attrs, set)
    CardSet.create(attrs_hash)

    p "Created set: #{set['name']}"
  end

  def create_card(card, set)
    attrs_hash = card_attrs_hash(card, set)
    populate_attributes(attrs_hash, card_attrs, card)
    existant_card = Card.find_by_name(card["name"])
    if existant_card
      existant_card.printings << set["code"]
      existant_card.save
    else
      Card.create(attrs_hash)
    end
  end

  def card_attrs
    %w[
      name cmc colors supertypes subtypes text flavor
      power toughness loyalty rulings types legalities
    ]
  end

  def card_attrs_hash(card, set)
    {
      "mana_cost" => card["manaCost"],
      "card_type" => card["type"],
      "set_name" => set["name"],
      "set" => set["code"],
      "multiverse_id" => card["multiverseid"],
      "printings" => [set["code"]]
    }
  end

  def populate_attributes(attributes_hash, attributes, object_json)
    attributes.map { |attr| attributes_hash[attr] = object_json[attr] }
  end
end
