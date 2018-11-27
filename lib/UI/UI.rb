class UI
  EMPTY = " "
  LINE = "---+---+---"
  PART = "|"

  def initialize(stdout = $stdout, stdin = $stdin)
    @out = stdout
    @in = stdin
  end

  def string_from_user message
    @out.print message
    @in.gets.chomp
  end

  def int_from_user message
    @out.print message
    @in.gets.chomp.to_i
  end

  def draw_cell(board, position)
    board.get_content(position).nil? ? EMPTY : board.get_content(position)
  end

  def show_grid board
    position = 0
    size = board.size

    for row in 1..size do
      for col in 1..size do
        @out.print EMPTY + draw_cell(board, position) + EMPTY
        @out.print PART if (col < size)
        position += 1
      end
      @out.print "\n" + LINE if (row < size)
      @out.print "\n"
    end
  end

  def get_position
    int_from_user("Please insert the position ") - 1
  end

  def get_symbol
    string_from_user("Please insert the symbol ")
  end

  def show_error_message message
    @out.print message
  end

  private :string_from_user, :int_from_user, :draw_cell

end
