require 'rspec'
require 'board'
require 'cell'

describe Board do

  let (:board) {Board.new(3)}
  let(:empty_cell) {board.empty_cell}

  it 'is an empty board size 3*3' do
    expect(board.grid).to eq(Array.new(3*3, empty_cell))
  end

  it 'places a mark' do
    board.mark(0, "X")
    expect(board.grid[0].symbol).to eq("X")
  end

end
