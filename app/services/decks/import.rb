module Decks
  class Import
    attr_reader :file, :deck

    def initialize(file, deck)
      @file = file
      @deck = deck
    end

    def run
      file.each_line do |line|
        sanitize(line)
        next if comment?(line) || line.blank?
        quantity, name = parse(line)
        quantity.times { import_card(name) }
      end
    end

    private

    # Some deck exporters will add a BOM (Byte Order Mark) before every line.
    # This removes them since they mess up the parsing
    def sanitize(line)
      line.delete!("\xEF\xBB\xBF")
    end

    def comment?(line)
      line.start_with?("//")
    end

    def parse(line)
      quantity, name = line.split(" ", 2)
      [quantity.to_i, name.chomp]
    end

    def import_card(name)
      card_id = Card.select(:id).find_by(name: name).id
      deck.deck_cards.create(card_id: card_id)
      deck.main_cards_ids << card_id
    end
  end
end
