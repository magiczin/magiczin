sets = JSON.parse(File.read("db/sets.json"))
sets.map do |_set_code, set|
  p "Creating set: #{set['name']}"
  CardSet.create(
    name: set["name"], code: set["code"], set_type: set["type"],
    release_date: set["release_date"], block: set["block"]
  )
  p "Created set: #{set['name']}"
  set["cards"].map do |card|
    Card.create(
      name: card["name"], mana_cost: card["manaCost"], cmc: card["cmc"],
      colors: card["colors"], card_type: card["type"], supertypes: card["supertypes"],
      subtypes: card["subtypes"], text: card["text"], flavor: card["flavor"],
      power: card["power"], toughness: card["toughness"], loyalty: card["loyalty"],
      rulings: card["rulings"], set_name: set["name"], set: set["code"],
      types: card["types"], multiverse_id: card["multiverseid"], legalities: card["legalities"]
    )
  end
end
