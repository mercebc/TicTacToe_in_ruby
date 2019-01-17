require 'rspec'
require 'core/flow'
require 'core/board'
require 'UI/UI'

describe Flow do

    let(:ui) { UI.new }
    let(:players) {[Human.new("X", ui), EasyComputer.new("O")]}
    let(:board) { Board.new(3) }
    let(:flow) { Flow.new(ui, players, board) }

    def mark_board(marks)
      marks.each do |position|
        board.mark(position, "X")
      end
    end

  it 'has a current player X' do
    expect(flow.current_player.symbol).to eq("X")
  end

  it 'has an opponent O' do
    expect(flow.opponent.symbol).to eq("O")
  end

  it 'can swap players' do
    flow.swap_players
    expect(flow.current_player.symbol).to eq("O")
    expect(flow.opponent.symbol).to eq("X")
  end

  it 'game is over' do
    mark_board([0, 1, 2])
    expect(flow.game_over).to be(true)
  end

  it 'game is not over' do
    mark_board([0, 2, 8])
    expect(flow.game_over).to be(false)
  end

  it 'has a winner X' do
    mark_board([0, 1, 2])
    expect(flow.winner).to eq(players[0])
  end

end
