class DecksController < ApplicationController
  def show
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.save
  end

  # Extract to some other controller later
  def card_types
    deck = Deck.find(params[:deck_id])
    @types = {}
    deck.cards.group(:types).count.map do |type, count|
      joined_type = type.join(" ")
      @types[joined_type] = count
    end
    respond_to do |format|
      format.js { render json: @types }
    end
  end

  # Extract to some other controller later
  def mana_curve
    cards = Deck.find(params[:deck_id]).cards
    @mana_costs = cards.where.not("types @> ARRAY[?]", "Land").group(:cmc).count
    respond_to do |format|
      format.js { render json: @mana_costs }
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
