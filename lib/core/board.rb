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

  def get_rows
    @grid.each_slice(@size).to_a
  end

  def get_columns
    get_rows.transpose
  end

  def get_diagonals
    diagonals = Array.new
    diagonals << get_left_diagonal(get_columns)
    diagonals << get_right_diagonal(get_rows)
  end

  def get_left_diagonal(columns)
    (0..@size-1).collect { |i| columns[i][i] }
  end

  def get_right_diagonal(rows)
    right_diagonal = Array.new
    (@size-1).downto(0).each_with_index do |num, idx|
      right_diagonal << rows[num][idx]
    end
    right_diagonal
  end

end
