require 'core/cell'

class Board
  attr_reader :grid
  attr_reader :capacity
  attr_reader :size

  def initialize (board_size)
    @size = board_size
    @capacity = size*size
    @grid = Array.new(capacity) {Cell.new()}
  end

  def mark (position, symbol)
   @grid[position].content = symbol
   @grid
  end

  def is_full?
    @grid.all? { |cell| !cell.is_empty? }
  end

  def get_content position
    @grid[position].content
  end
end

