require 'rspec'
require 'board'

describe Board do

  let (:board) {Board.new(3)}
  let(:empty_cell) {Board.const_get(:EMPTY_CELL)}

  it 'is an empty board size 3*3' do
    expect(board.grid).to eq(Array.new(3*3, empty_cell))
  end

  it 'places a mark' do
    expect(board.mark(0, "X")).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
  end

end
