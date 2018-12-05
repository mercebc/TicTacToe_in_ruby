require 'core/cell'

class Board
  attr_reader :grid
  attr_reader :capacity
  attr_reader :size

  def initialize(board_size)
    @size = board_size
    @capacity = size*size
    @grid = Array.new(capacity) {Cell.new()}
  end

  def mark(position, symbol)
   @grid[position].content = symbol
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

  def has_a_winner?(players)
    for player in players do
      return true if is_a_winner?(player)
    end
    false
  end

  def is_a_winner?(player)
    lines = get_all_lines
    for line in lines do
      return true if has_a_winning_line(line, player)
    end
    false
  end

  private

  def has_a_winning_line(line, player)
    line.all? { |cell| cell.belongs_to(player) }
  end

  def get_rows
    @grid.each_slice(@size).to_a
  end

  def get_columns
    get_rows.transpose
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

  def get_all_lines
    columns = get_columns
    rows = get_rows
    lines = columns + rows
    lines << get_left_diagonal(columns)
    lines << get_right_diagonal(rows)
  end

end
