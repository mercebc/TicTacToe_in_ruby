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

  def display_message(message)
    @out.print message
  end

  def display_grid(board)
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

  def display_turn(current_player, board)
    @out.print("Player " + current_player.symbol + "'s turn:\n")
    display_grid(board)
  end

  def display_insert_position(current_player)
    @out.print("Player " + current_player.symbol + ", please insert a position: ")
  end

  def announce_winner(winner)
    @out.print(winner.symbol + " has won")
  end

  def announce_tie
    @out.print("It's a tie")
  end

  private :draw_cell

end
