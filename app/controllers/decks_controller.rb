class DecksController < ApplicationController
  def new
    @deck = Deck.new
    @cards = Card.full_text_search(params[:full_text_query]).page(params[:page]).per(10)
  end
end
