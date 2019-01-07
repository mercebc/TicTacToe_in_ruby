require 'rspec'
require 'core/players/hard_computer'
require 'core/board'

describe HardComputer do

  let(:intelligent_computer) { HardComputer.new("X") }
  let(:human) { Human.new("O", ui) }
  let(:ui) { UI.new }
  let(:players) {[intelligent_computer, human]}
  let(:flow) { Flow.new(ui, players, 3) }

  def mark_board(marks, symbol)
    marks.each do |position|
      flow.board.mark(position, symbol)
    end
  end

  it 'computer wins' do
    mark_board([0, 3, 7], "O")
    mark_board([4, 6, 8], "X")
    expect(intelligent_computer.get_position(flow)).to eq(2)
  end
  it 'avoid human player to win' do
    mark_board([1, 2, 5], "O")
    mark_board([0, 3], "X")
    expect(intelligent_computer.get_position(flow)).to eq(6)
  end

  it 'computer wins and human player starts' do
    mark_board([0, 7], "O")
    mark_board([4, 6, 8], "X")
    expect(intelligent_computer.get_position(flow)).to eq(2)
  end

  it 'avoid human player to win and human player starts' do
    mark_board([1, 4], "O")
    mark_board([0], "X")
    expect(intelligent_computer.get_position(flow)).to eq(7)
  end

  it 'computer wins over avoiding player to win' do
    mark_board([3, 4], "O")
    mark_board([6, 7], "X")
    expect(intelligent_computer.get_position(flow)).to eq(8)
  end
end
