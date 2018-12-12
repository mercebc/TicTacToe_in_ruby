class UI
  EMPTY = " "
  PART = "|"
  DIVIDER = "---"
  PLUS = "+"
  attr_reader :out, :in

  def initialize(stdout = $stdout, stdin = $stdin)
    @out = stdout
    @in = stdin
  end

  def get_move
    move = Integer @in.gets.chomp
  rescue ArgumentError
    show_error_message("Please insert a valid number ")
    get_move
  end

  def get_mode
    @in.gets.chomp
  end

  def draw_cell(board, position)
    board.get_content(position).nil? ? (position + 1).to_s : board.get_content(position)
  end

  def show_grid board
    position = 0
    size = board.size

    for row in 1..size do
      for col in 1..size do
        @out.print EMPTY + draw_cell(board, position) + EMPTY
        @out.print PART if col < size
        position += 1
      end
      @out.print "\n"
      for col in 1..size do
        @out.print DIVIDER if row < size
        @out.print PLUS if (col < size and row < size)
      end
      @out.print "\n" if row < size
    end
  end

  def get_position
    @out.print "Please insert the position "
    get_move - 1
  end

  def get_game_mode
    @out.print "Please, introduce 'h' for human-human or 'e' for easy computer "
    get_mode
  end

  def print_message message
    @out.print message
  end

  def announce_results(board, players)
    if board.win?(players)
      winner = players.select { |player| board.winner?(player) }.first
      print_message(winner.symbol + " has won")
    else
      print_message("It's a tie")
    end
  end

  private :get_move, :get_mode, :draw_cell

end
