class LobbyForm < Dry::Struct
  constructor_type :schema

  attribute :name, Types::Strict::String
  attribute :number_of_players, Types::Coercible::Int
  attribute :game_type, Types::Strict::String

  def game_types
    %w[Draft Sealed]  
  end

  def to_model
    @lobby ||= Lobby.new
  end

  def model_name
    "Lobby"
  end

  def save
    @lobby = Lobby.create(__attributes__)
  end
end
