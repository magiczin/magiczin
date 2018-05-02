class DecksController < ApplicationController
  def show
    deck = Deck.find(params[:id])
    @cards = deck.cards.decorate
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.save
  end

  # Extract to some other controller later
  # Extract logic to a service
  def card_types
    cards = Deck.find(params[:deck_id]).cards
    @types = {}
    cards.group(:types).count.map do |type, count|
      joined_type = type.join(" ")
      @types[joined_type] = count
    end
    respond_to do |format|
      format.js { render json: @types }
    end
  end

  # Extract to some other controller later
  # Extract logic to a service
  def mana_curve
    cards = Deck.find(params[:deck_id]).cards
    @mana_costs = cards.where.not("types @> ARRAY[?]", "Land").group(:cmc).count
    respond_to do |format|
      format.js { render json: @mana_costs }
    end
  end

  # Extract to some other controller later
  # Extract logic to a service
  def color_distribution
    @colors = {}
    color_distribution = Deck.find(params[:deck_id]).cards.group(:colors).count
    @colors["Colorless"] = color_distribution[nil]
    color_distribution.delete(nil)
    color_distribution.map do |color, count|
      joined_colors = color.join(" / ")
      @colors[joined_colors] = count
    end
    respond_to do |format|
      format.js { render json: @colors }
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
