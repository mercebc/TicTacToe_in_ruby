require 'rspec'
require 'core/players/easy_computer'
require 'core/board'

describe EasyComputer do

  let(:random_computer) { EasyComputer.new("X") }
  let(:ui) { UI.new }
  let(:players) {[Human.new("O", ui), random_computer]}
  let(:board) { Board.new(3) }
  let(:flow) { Flow.new(ui, players, board) }

  it 'gets a random position' do
    expect(board.available_positions).to include(random_computer.get_position(flow))
  end
end
