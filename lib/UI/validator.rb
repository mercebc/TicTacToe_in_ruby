require 'UI/UI'
require 'core/board'

class Validator

  def valid_mode?(option)
    regex = Regexp.new("^([e|E|h|H])$")
    regex.match(option).nil? ? false : true
  end

  def valid_move?(position, board)
    regex = Regexp.new("^([1-9])$")
    return false if regex.match(position).nil?
    return false if board.invalid_cell(position.to_i-1)
    true
  end

end

