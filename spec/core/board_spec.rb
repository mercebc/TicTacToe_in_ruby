require 'rspec'
require 'core/board'
require 'core/cell'

describe Board do

  let(:board) { Board.new(3) }

  def mark_board(marks)
    marks.each do |position|
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
    expect(board.get_content(1)).to be(nil)
  end

  it 'can mark itself with a symbol' do
    board.mark(1, "X")
    expect(board.grid[1].content).to eq("X")
    expect(board.grid[3].content).to be(nil)
  end

  it 'is not a tie when some cells are empty' do
    board.mark(0, "X")
    board.mark(4, "X")
    expect(board.tie?).to be(false)
  end

  it 'its a tie when all cells have a value' do
    capacity = board.capacity - 1
    for i in 0..capacity
      board.mark(i, "X")
    end
    expect(board.tie?).to be(true)
  end

  it 'a cell that is not empty is invalid' do
    board.mark(0, "X")
    expect(board.invalid_cell(0)).to be(true)
  end

  it 'a cell that is empty is not invalid' do
    expect(board.invalid_cell(0)).to be(false)
  end

  it 'gets all the empty cells' do
    mark_board([0, 1, 2, 3, 4, 7])
    expect(board.all_empty_cells).to eq([board.grid[5], board.grid[6], board.grid[8]])
  end

  it 'get all the available positions' do
    mark_board([0, 1, 2, 3, 4, 7])
    expect(board.available_positions).to eq([5,6,8])
  end

  it 'has a winner' do
    mark_board([2, 4, 6])
    user_ui = UI.new
    my_players = [Human.new("X", user_ui), Human.new("O", user_ui)]
    expect(board.win?(my_players)).to be(true)
  end

  it 'doesnt have a winner' do
    mark_board([2, 4])
    user_ui = UI.new
    my_players = [EasyComputer.new("X"), Human.new("O", user_ui)]
    expect(board.win?(my_players)).to be(false)
  end

  it 'player one is the winner' do
    mark_board([2, 4, 6])
    user_ui = UI.new
    player_one = Human.new("X", user_ui)
    expect(board.winner?(player_one)).to be(true)
  end

  it 'player two is not the winner' do
    mark_board([2, 4, 6])
    player_two = EasyComputer.new("O")
    expect(board.winner?(player_two)).to be(false)
  end

end
