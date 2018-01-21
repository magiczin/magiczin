class SealedsController < ApplicationController
  def new
    @sets = CardSet.where(set_type: 'expansion').order(release_date: :desc) 
  end

  def create
    @cards = Sealed::Create.perform(params[:set_code])   
    render :show
  end
end
