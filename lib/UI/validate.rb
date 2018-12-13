require 'UI/UI'
require 'core/board'

class Validate

  def mode(option)
    return true if option =~ /^[e|E|h|H]$/
    false
  end

  def position(position)
   Integer position
   rescue ArgumentError
     return false
  end

  def move(position, board)
   return false if !position.between?(0, board.capacity-1)
   return false if board.invalid_cell(position)
   true
  end

end

