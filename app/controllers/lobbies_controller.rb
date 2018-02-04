class LobbiesController < ApplicationController
  def new
    @form = LobbyForm.new
  end

  def show
    @lobby = Lobby.find(params[:id]).decorate
  end

  def create
    @form = LobbyForm.new(lobby_params)
    @form.save

    redirect_to @form
  end

  private

  def lobby_params
    params.require(:lobby).permit(:name, :game_type, :number_of_players).to_h
  end
end
