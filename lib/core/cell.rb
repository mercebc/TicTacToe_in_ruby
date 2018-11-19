class Cell
  EMPTY = " "
  attr_accessor :value

  def initialize
    @value = EMPTY
  end

  def is_empty?
    @value == EMPTY
  end
end
