require 'rspec'
require 'core/board'
require 'core/cell'

describe Board do
  before(:each) do
    @board = Board.new(3)
  end

  it 'size is 3' do
    expect(@board.size).to eq(3)
  end

  it 'has 9 available spaces' do
    expect(@board.capacity).to eq(9)
  end

  it 'can get a content of a cell' do
    expect(@board.get_content(1)).to eq(nil)
  end

  it 'can mark itself with a symbol' do
    @board.mark(1, "X")
    expect(@board.grid[1].content).to eq("X")
    expect(@board.grid[3].content).to eq(nil)
  end

  it 'is not full when some cells are empty' do
    @board.mark(0, "X")
    @board.mark(4, "X")
    expect(@board.is_full?).to eq(false)
  end

  it 'is full when all cells have a value' do
    capacity = @board.capacity - 1
    for i in 0..capacity
      @board.mark(i, "X")
    end
    expect(@board.is_full?).to eq(true)
  end
end
