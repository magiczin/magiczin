class BoostersController < ApplicationController
  def new
    @sets = CardSet.where(set_type: 'expansion').order(release_date: :desc)
    @booster = Booster.new
  end

  def show
    @booster = Booster.find(params[:id])
  end

  def create
    booster = Booster.create
    set_code = CardSet.find(booster_params[:card_set_id]).code
    Boosters::CreateCards.perform(set_code, booster)

    redirect_to booster
  end

  def export
    cards = Card.where(id: cards_for_export)
    @cards = Exporters::Text.perform(cards)

    render 'common/export'
  end

  private

  def booster_params
    params.require(:booster).permit(:card_set_id) 
    params[:booster]
  end

  def cards_for_export
    params.keys.map do |key|
      key.gsub("checkbox_", "")
    end 
  end
end
