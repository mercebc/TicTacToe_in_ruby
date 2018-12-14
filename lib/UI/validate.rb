require 'UI/UI'
require 'core/board'

class Validate

  def mode(option)
    regex = Regexp.new("^([e|E|h|H])$")
    return false if regex.match(option).nil?
    true
  end

  def move(position, board)
    regex = Regexp.new("^([1-9])$")
    return false if regex.match(position).nil?
    return false if board.invalid_cell(position.to_i-1)
    true
  end

end

