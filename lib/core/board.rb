require 'core/cell'

class Board
  attr_reader :grid, :capacity, :size

  def initialize(board_size)
    @size = board_size
    @capacity = size*size
    @grid = Array.new(capacity) {Cell.new()}
  end

  def mark(position, symbol)
   @grid[position].content = symbol
  end

  def tie?
    @grid.all? { |cell| !cell.is_empty? }
  end

  def get_content(position)
    @grid[position].content
  end

  def invalid_cell(position)
    !@grid[position].is_empty?
  end

  def all_empty_cells
    @grid.find_all { |cell| cell.is_empty? }
  end

  def available_positions
    available_positions = Array.new
    all_empty_cells.each do |empty_cell|
      available_positions << @grid.index(empty_cell)
    end
    available_positions
  end

  def win?(players)
    players.any? { |player| winner?(player) }
  end

  def winner?(player)
    lines = get_all_lines
    lines.any? { |line| winning_line?(line, player) }
  end

  private

  def winning_line?(line, player)
    line.all? { |cell| cell.belongs_to?(player) }
  end

  def get_rows
    @grid.each_slice(@size).to_a
  end

  def get_columns
    get_rows.transpose
  end

  def get_left_diagonal
    columns = get_columns
    (0..@size-1).collect { |i| columns[i][i] }
  end

  def get_right_diagonal
    rows = get_rows
    right_diagonal = Array.new
    (@size-1).downto(0).each_with_index do |num, idx|
      right_diagonal << rows[num][idx]
    end
    right_diagonal
  end

  def get_all_lines
    get_columns + get_rows << get_left_diagonal << get_right_diagonal
  end

end
