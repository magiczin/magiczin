class DestroyBooster
  include Sidekiq::Worker
  
  def perform(booster_id)
    Booster.destroy(booster_id)
  end
end
