class BoostersController < ApplicationController
  def new
    @sets = CardSet.where(set_type: 'expansion').order(release_date: :desc)
    @booster = Booster.new
  end

  def show
    @booster = Booster.find(params[:id])
  end

  def create
    booster = Boosters::Create.new(set_id).perform

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

  def set_id
    booster_params[:card_set_id]
  end

  def cards_for_export
    params.keys.map do |key|
      key.gsub("checkbox_", "")
    end 
  end
end
