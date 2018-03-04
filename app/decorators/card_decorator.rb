class CardDecorator < Draper::Decorator
  delegate_all

  def title
    "#{name} #{mana_cost}"
  end

  def image_url
    "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=#{multiverse_id}&type=card"
  end

  def multiverse_url
    "#{Card::MULTIVERSE_CARD_BASE_URL}?multiverseid=#{multiverse_id}"
  end
end
