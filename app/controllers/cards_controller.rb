class CardsController < ApplicationController
  def index
    @search = CardsSearch.new(search_params)
    @cards = @search.results.page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @cards }
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private

  def search_params
    params.fetch(:cards_search) { {} }
  end
end
