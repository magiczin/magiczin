require "searchlight/adapters/action_view"

class CardsSearch < Searchlight::Search
  include Searchlight::Adapters::ActionView

  def base_query
    Card.unscoped
  end

  def search_full_text_search
    query.full_text_search(full_text_search)
  end

  def search_cmc
    query.where(cmc: cmc)
  end

  def search_colors
    query.where("colors @> ARRAY[?]", colors)
  end

  def search_card_type
    query.where(card_type: card_type)
  end
end
