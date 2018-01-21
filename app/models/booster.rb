class Booster < ApplicationRecord
  belongs_to :card_set, optional: true

  has_many :cards, dependent: :destroy

  after_commit :enqueue_destruction, on: :create

  private

  def enqueue_destruction
    DestroyBooster.perform_in(1.hour, id) 
  end
end
