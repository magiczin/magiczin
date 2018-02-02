class Lobby < ApplicationRecord
  has_many :drafts
  has_many :users
end
