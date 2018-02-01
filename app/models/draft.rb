class Draft < ApplicationRecord
  has_many :boosters
  has_many :users
end
