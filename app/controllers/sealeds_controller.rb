class SealedsController < ApplicationController
  def new
    @sets = CardSet.where(set_type: 'expansion').order(release_date: :desc) 
  end

  def create
    @cards = Sealed::Create.perform(sets)   
    render :show
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
