require 'UI/UI'
require 'core/board'

class Validator

  def valid_mode?(option)
    option = option.downcase
    regex = Regexp.new("^([e|h|i])$")
    regex.match(option).nil? ? false : true
  end

  def valid_yn?(option)
    option = option.downcase
    regex = Regexp.new("^([y|n])$")
    regex.match(option).nil? ? false : true
  end

  def valid_move?(position, board)
    regex = Regexp.new("^([1-9])$")
    return false if regex.match(position).nil?
    return false if board.invalid_cell(position.to_i-1)
    true
  end

end

