class CardDecorator < Draper::Decorator
  delegate_all

  def title
    "#{name} #{mana_cost}"
  end
end
