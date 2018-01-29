require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "returns hash with card name as key and quantity as value" do
    card = Card.new(name: 'Some name')
    card2 = Card.new(name: 'Different name')
    cards = [card, card, card, card2]

    assert_equal({ "Some name" => 3, "Different name" => 1 }, 
                 Exporters::Text.perform(cards))
  end
end
