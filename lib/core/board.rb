require 'core/cell'

class Board
  attr_reader :grid
  attr_reader :capacity

  def initialize (size)
    @capacity = size*size
    @grid = Array.new(capacity) {Cell.new()}
  end

  def mark (position, mark)
   @grid[position].value = mark
   @grid
  end

  def is_full?
    @grid.all? { |cell| !cell.is_empty? }
  end
end

