class Draft < ApplicationRecord
  belongs_to :lobby

  has_many :boosters
  has_many :users
end
