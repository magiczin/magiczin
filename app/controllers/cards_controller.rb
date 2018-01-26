class CardsController < ApplicationController
  def index
    @cards = scope.cards.order(:colors, :cmc, :name)
  end

  private

  def scope
    @scope ||= params[:scope].constantize.find(params[:scope_id])
  end
end
