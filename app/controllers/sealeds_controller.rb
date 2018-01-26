class SealedsController < ApplicationController
  def new
    @sets = CardSet.where(set_type: 'expansion').order(release_date: :desc) 
  end

  def show
    @sealed = Sealed.find(params[:id])

    redirect_to cards_path(scope: "Sealed", scope_id: params[:id])
  end

  def create
    sealed = Sealed.create
    @cards = Sealeds::Create.perform(sets, sealed)

    redirect_to sealed
  end

  private

  def sets
    [].tap do |sets|
      6.times do |i|
        sets << params.send("[]", "set#{i+1}")
      end
    end
  end
end
