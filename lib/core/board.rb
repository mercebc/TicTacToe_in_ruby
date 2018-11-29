require 'core/cell'

class Board
  attr_reader :grid
  attr_reader :capacity
  attr_reader :size
  attr_accessor :columns
  attr_accessor :lines
  attr_accessor :rows

  def initialize(board_size)
    @size = board_size
    @capacity = size*size
    @grid = Array.new(capacity) {Cell.new()}
    @columns = Array.new
    @lines = Array.new
    @rows = Array.new
  end

  def mark(position, symbol)
   @grid[position].content = symbol
   @grid
  end

  def is_full?
    @grid.all? { |cell| !cell.is_empty? }
  end

  def get_content(position)
    @grid[position].content
  end

  def invalid_cell(position)
    !@grid[position].is_empty?
  end

  def get_columns(grid)#columns is a global variable and it is changed every timme you run this function!!! and it shouldnt be like that
    @columns << grid.slice!(0..@size -1)
    grid.length > 0 ? get_columns(grid) : @columns
  end

  def get_rows(grid)
    get_columns(grid).transpose
  end

  def get_diagonal(grid)
  end

end
