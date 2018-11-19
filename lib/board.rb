require 'cell'

class Board
  attr_reader :grid
  attr_reader :capacity
  attr_reader :empty_cell

  def initialize (size)
    @empty_cell = Cell.new()
    @capacity = size*size
    @grid = Array.new(capacity, empty_cell)
  end

  def mark (position, mark)
   @grid[position].value = mark
   @grid
  end

end

