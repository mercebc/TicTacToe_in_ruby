class Board
  EMPTY_CELL = " "
  attr_accessor :grid 
  attr_accessor :capacity

  def initialize (size)
    @capacity = size*size
    @grid = Array.new(capacity, EMPTY_CELL)
  end

  def mark (position, mark)
   @grid[position] = mark
   @grid
  end

end

