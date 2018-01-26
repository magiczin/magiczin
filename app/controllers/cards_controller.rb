class CardsController < ApplicationController
  def index
    @cards = scope.cards
  end

  private

  def scope
    @scope ||= params[:scope].constantize.find(params[:scope_id])
  end
end
