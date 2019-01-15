require 'pg'

class GameDAO
  attr_reader :id, :name, :board_size, :mode, :current_player

  def initialize(id, name, board_size, mode, current_player)
    @id = id
    @name = name
    @board_size = board_size
    @mode = mode
    @current_player = current_player
  end

  def self.all(connection)
    results = connection.exec("SELECT * FROM game")
    return nil unless results.values.length > 0
    games = Array.new
    results.each do |result|
      id = result['id'].to_i
      name = result['name']
      board_size = result['board_size'].to_i
      mode = result['mode']
      current_player = result['current_player']
      game = self.new(id, name,  board_size, mode, current_player)
      games << game
    end
    games
  end

  def self.find(name, connection)
    result = connection.exec_params("SELECT * FROM game WHERE name = $1", [name]).first
    return nil unless result
    id = result['id'].to_i
    name = result['name']
    board_size = result['board_size'].to_i
    mode = result['mode']
    current_player = result['current_player']
    game = self.new(id, name, board_size, mode, current_player)
  end

  def self.delete(name, connection)
    connection.exec_params("DELETE FROM game WHERE name = $1", [name])
  end

  def insert(connection)
    result = connection.exec_params("INSERT INTO game (name, board_size, mode, current_player) VALUES ($1, $2, $3, $4) RETURNING id", [name, board_size, mode, current_player])
    @id = result.first['id'].to_i if result.first['id']
  end

end
