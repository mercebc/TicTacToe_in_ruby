require 'rspec'
require 'core/flow'
require 'core/board'
require 'UI/UI'

describe Flow do

    let(:ui) { UI.new }
    let(:board) { Board.new(3) }
    let(:flow) { Flow.new(ui, board) }

    def mark_board(marks)
      for position in marks
        board.mark(position, "X")
      end
    end

  it 'current player is the first player in the array' do
    expect(flow.current_player.symbol).to eq("X")
  end

  it 'opponent is the last player in the array' do
    expect(flow.opponent.symbol).to eq("O")
  end

  it 'swap players in the array' do
    flow.swap_players
    expect(flow.current_player.symbol).to eq("O")
    expect(flow.opponent.symbol).to eq("X")
  end

  it 'game is over' do
    mark_board([0, 1, 2])
    expect(flow.game_over).to be true
  end

  it 'game is not over' do
    mark_board([0, 2, 8])
    expect(flow.game_over).to be false
  end

end
