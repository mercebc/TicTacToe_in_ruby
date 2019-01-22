class GameRepository

  def initialize(connection)
    @connection = connection
  end

  def writeGame(name, mode, board)
    insertSqlQuery = "INSERT INTO game (name, mode, board) VALUES ($1, $2, $3)"
    @connection.exec_params(insertSqlQuery, [name, mode, board]).first
  end

  def readGameByName(name)
    readSqlQuery = "SELECT * FROM game WHERE name = $1"
    @connection.exec_params(readSqlQuery, [name]).first
  end

  def parse_board(board_string)
    size = board_size(board_string)
    new_board = Board.new(size)
    load_new_board(board_string, new_board)
  end

  def board_size(board_string)
    Math.sqrt(board_string.length).to_i
  end

  def load_new_board(board_string, new_board)
    board = board_string.chars
    board = board.map { |symbol| symbol == "_" ? nil : symbol }
    board.each_with_index do |symbol, position|
      new_board.mark(position, symbol)
    end
    new_board
  end

  def current_player_symbol(board_string)
    board = board_string.chars
    board.delete("_")
    board.min_by { |i| board.count(i) }
  end

end
