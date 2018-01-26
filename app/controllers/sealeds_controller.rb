class SealedsController < ApplicationController
  def new
    @sets = CardSet.where(set_type: 'expansion').order(release_date: :desc) 
  end

  def show
    @sealed = Sealed.find(params[:id])
  end

  def create
    sealed = Sealed.create
    @cards = Sealeds::Create.perform(card_sets, sealed)

    redirect_to sealed
  end

  def export
    cards = Card.where(sealed_id: params[:id])
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
end
