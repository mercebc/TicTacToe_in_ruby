require 'rspec'
require 'core/board'
require 'core/cell'

describe Board do
  before(:each) do
    @board = Board.new(3)
  end

  it 'is an empty board size 3*3' do
    expect(@board.grid.length).to eq(9)
  end

  it 'places a mark' do
    @board.mark(0, "X")
    expect(@board.grid[0].value).to eq("X")
    expect(@board.grid[2].value).to eq(" ")
  end

  it 'is not full when some cells are empty' do
    @board.mark(0, "X")
    @board.mark(4, "X")
    expect(@board.is_full?).to eq(false)
  end

  it 'is full when all cells have a value' do
    @board.mark(0, "X")
    @board.mark(1, "X")
    @board.mark(2, "X")
    @board.mark(3, "X")
    @board.mark(4, "X")
    @board.mark(5, "X")
    @board.mark(6, "X")
    @board.mark(7, "X")
    @board.mark(8, "X")
    expect(@board.is_full?).to eq(true)
  end
end
