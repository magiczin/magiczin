class LobbyDecorator < Draper::Decorator
  delegate_all

  def sets
    CardSet.where(set_type: 'expansion').order(release_date: :desc)
  end

  def game_object
    game_type.constantize.send(:new)
  end
end
