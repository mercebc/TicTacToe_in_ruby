require 'rspec'
require 'core/board'
require 'core/cell'

describe Board do

  let(:board) { Board.new(3) }

  def mark_board(marks)
    for position in marks
    board.mark(position, "X")
    end
  end

  it 'size is 3' do
    expect(board.size).to eq(3)
  end

  it 'has 9 available spaces' do
    expect(board.capacity).to eq(9)
  end

  it 'can get a content of a cell' do
    expect(board.get_content(1)).to eq(nil)
  end

  it 'can mark itself with a symbol' do
    board.mark(1, "X")
    expect(board.grid[1].content).to eq("X")
    expect(board.grid[3].content).to eq(nil)
  end

  it 'is not full when some cells are empty' do
    board.mark(0, "X")
    board.mark(4, "X")
    expect(board.is_full?).to eq(false)
  end

  it 'is full when all cells have a value' do
    capacity = board.capacity - 1
    for i in 0..capacity
      board.mark(i, "X")
    end
    expect(board.is_full?).to eq(true)
  end

  it 'a cell that is not empty is invalid' do
    board.mark(0, "X")
    expect(board.invalid_cell(0)).to be true
  end

  it 'a cell that is empty is not invalid' do
    expect(board.invalid_cell(0)).to be false
  end

  it 'get the rows' do
    mark_board([0, 2, 3, 7])
    columns = board.get_rows
    expect(columns[0][0].content).to eq("X")
    expect(columns[0][2].content).to eq("X")
    expect(columns[1][0].content).to eq("X")
    expect(columns[2][1].content).to eq("X")
  end

  it 'get the columns' do
    mark_board([0, 2, 3, 7])
    rows = board.get_columns
    expect(rows[0][0].content).to eq("X")
    expect(rows[2][0].content).to eq("X")
    expect(rows[0][1].content).to eq("X")
    expect(rows[1][2].content).to eq("X")
  end

  it 'get the left diagonal' do
    mark_board([0, 4, 8])
    columns = board.get_columns
    left_diagonal = board.get_left_diagonal(columns)
    expect(left_diagonal[0].content).to eq("X")
    expect(left_diagonal[1].content).to eq("X")
    expect(left_diagonal[2].content).to eq("X")
  end

  it 'get the right diagonal' do
    mark_board([2, 4, 6])
    rows = board.get_rows
    right_diagonal = board.get_right_diagonal(rows)
    expect(right_diagonal[0].content).to eq("X")
    expect(right_diagonal[1].content).to eq("X")
    expect(right_diagonal[2].content).to eq("X")
  end
end
