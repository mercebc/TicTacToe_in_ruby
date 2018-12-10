require 'rspec'
require 'core/players/easy_computer'
require 'core/board'

describe Easy_computer do

  let(:random_computer) { Easy_computer.new("X") }
  let(:board) { Board.new(3) }

  it 'gets a random position' do
    expect(board.available_positions).to include(random_computer.get_position(board))
  end
end
