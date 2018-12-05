class Cell
  EMPTY = nil
  attr_accessor :content

  def initialize
    @content = EMPTY
  end

  def is_empty?
    @content == EMPTY
  end

  def belongs_to?(player)
    @content == player.symbol
  end
end
