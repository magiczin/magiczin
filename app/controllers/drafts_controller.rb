class DraftsController < ApplicationController
  def create
    @draft = Draft.create(draft_params)
    booster_set_ids.map do |set_id|
      Boosters::Create.new(set_id, @draft.id).perform
    end
  end

  private

  def draft_params
    params.require(:draft).permit(:lobby_id)
  end
  
  def booster_set_ids
    params.select { |k, _| k.starts_with?("booster") }.values
  end
end
