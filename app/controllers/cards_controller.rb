class CardsController < ApplicationController
  def index
    @cards = booster.cards
  end

  private

  def booster
    @booster ||= Booster.find(params[:booster_id])
  end
end
