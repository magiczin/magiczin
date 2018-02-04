module LobbiesHelper
  def render_game_setup(lobby)
    partial = determine_partial(lobby)
    render partial, object: lobby.game_object, sets: lobby.sets
  end

  private

  def determine_partial(lobby)
    "#{lobby.game_type.downcase}s/new" 
  end
end
