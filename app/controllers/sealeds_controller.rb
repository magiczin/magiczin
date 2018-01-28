class SealedsController < ApplicationController
  before_action :authenticate

  def new
    @sets = CardSet.where(set_type: 'expansion').order(release_date: :desc)
  end

  def show
    @sealed = Sealed.find(params[:id])
    @cards = @sealed.cards.order(:colors, :cmc, :name)
  end

  def create
    sealed = Sealed.create
    @cards = Sealeds::Create.perform(card_sets, sealed)

    redirect_to sealed
  end

  def export
    cards = Card.where(id: cards_for_export)
    @cards = Exporters::Text.perform(cards)

    render 'common/export'
  end

  private

  def card_sets
    [].tap do |card_sets|
      6.times do |i|
        card_sets << params.send("[]", "set#{i+1}")
      end
    end
  end

  def cards_for_export
    params.keys.map do |key|
      key.gsub("checkbox_", "")
    end
  end
end
