require 'UI/UI'
require 'core/board'
require 'database/game_dao'

class Validator

  def valid_mode?(option)
    regex = Regexp.new("^([e|E|h|H|i|I])$")
    regex.match(option).nil? ? false : true
  end

  def valid_move?(position, board)
    regex = Regexp.new("^([1-9])$")
    return false if regex.match(position).nil?
    return false if board.invalid_cell(position.to_i-1)
    true
  end

  def existent_game_name?(name, connection)
    return false if GameDAO.find(name, connection).nil?
    true
  end

  def valid_yN?(answer)
    regex = Regexp.new("^([y|Y|n|N])$")
    regex.match(answer).nil? ? false : true
  end
end

