module CardsHelper
  def options_for_colors_select
    {}.tap do |opts|
      Card::CARD_COLORS.map do |color|
        opts[color] = color
      end
    end
  end
end
