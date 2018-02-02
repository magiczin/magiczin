class LobbiesController < ApplicationController
  def new
    @lobby = Lobby.new
  end

  def show
    @lobby = Lobby.find(params[:id])
    @sets = CardSet.where(set_type: 'expansion').order(release_date: :desc)
    @draft = @lobby.drafts.build
    3.times { @draft.boosters.build }
  end

  def create
    @lobby = Lobby.new(lobby_params)
    @lobby.save

    redirect_to @lobby
  end

  private

  def lobby_params
    params.require(:lobby).permit(:name, :number_of_players)
  end
end
