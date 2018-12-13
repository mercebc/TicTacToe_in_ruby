require 'UI/Validate'
require 'core/players/Human'
require 'core/players/Easy_computer'

class UI
  EMPTY = " "
  PART = "|"
  DIVIDER = "---"
  PLUS = "+"
  attr_reader :out, :in

  def initialize(stdout = $stdout, stdin = $stdin)
    @out = stdout
    @in = stdin
    @validate = Validate.new
  end

  def get_position(board)
    position = @validate.position(@in.gets.chomp)
    until position != false
      @out.print("Please insert a valid number \n")
      get_position(board)
    end
    position-=1
    until @validate.move(position, board)
      @out.print("Please insert a valid position \n")
      get_position(board)
    end
    position
  end

  def get_mode
    @out.print "Please, introduce 'h' for human-human or 'e' for easy computer"
    option = @in.gets.chomp
    until @validate.mode(option)
      @out.print("Please insert a valid option /n")
      get_mode
    end
    option
  end

  def draw_cell(board, position)
    board.get_content(position).nil? ? (position + 1).to_s : board.get_content(position)
  end

  def clear_screen
    system "clear"
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

  private :draw_cell

end
