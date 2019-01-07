require 'core/board'
require 'UI/UI'

class HardComputer
  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
    @ui = UI.new
  end

  def get_position(flow)
    get_best_move(flow)
  end

  def get_best_move(flow, depth=0, best_score={})

    return scoring(flow, depth) if flow.game_over

    flow.board.available_positions.each do |position|
      simulate_move(flow, position, flow.current_player.symbol)
      best_score[position] = get_best_move(flow, depth + 1, {})
      reset_simulated_move(flow, position)
    end

    if depth == 0
      return best_position(best_score)
    elsif depth > 0 and flow.current_player == self
      return highest_score(best_score)
    elsif depth > 0 and flow.current_player != self
      return lowest_score(best_score)
    end

  end

  def scoring(flow, depth)
    @opponent = opponent(flow)
    return 10 - depth if flow.board.winner?(self)
    return depth - 10 if flow.board.winner?(@opponent)
    return 0 if flow.board.tie?
  end

  def simulate_move(flow, position, symbol)
    flow.board.mark(position, symbol)
    flow.swap_players
  end

  def reset_simulated_move(flow, position)
    flow.board.reset_cell(position)
    flow.swap_players
  end

  def best_position(best_score)
    best_score.max_by { |key, value| value }[0]
  end

  def highest_score(best_score)
    best_score.max_by { |key, value| value }[1]
  end

  def lowest_score(best_score)
    best_score.min_by { |key, value| value }[1]
  end

  def opponent(flow)
    flow.players.first.symbol == self.symbol ? flow.players.last : flow.players.first
  end
end
