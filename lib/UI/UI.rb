require 'UI/Validator'
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
    @validator = Validator.new
  end

  def get_position(board)
    position = @in.gets.chomp
    unless @validator.valid_move?(position, board)
      @out.print("Please insert a valid position: ")
      get_position(board)
    else
      position.to_i-1
    end
  end

  def get_mode
    @out.print "Please, introduce 'h' for human-human, 'e' for easy computer or 'i' for intelligent computer\n"
    option = @in.gets.chomp
    unless @validator.valid_mode?(option)
      @out.print("The option is not valid. ")
      get_mode
    else
      option.downcase
    end
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
