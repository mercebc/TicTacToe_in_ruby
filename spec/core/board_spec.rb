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

  it 'has a winner' do
    mark_board([2, 4, 6])
    user_ui = UI.new
    my_players = [Player.new("X", user_ui), Player.new("O", user_ui)]
    expect(board.has_a_winner?(my_players)).to be true
  end

  it 'doesnt have a winner' do
    mark_board([2, 4])
    user_ui = UI.new
    my_players = [Player.new("X", user_ui), Player.new("O", user_ui)]
    expect(board.has_a_winner?(my_players)).to be false
  end

  it 'player one is the winner' do
    mark_board([2, 4, 6])
    user_ui = UI.new
    player_one = Player.new("X", user_ui)
    expect(board.is_a_winner?(player_one)).to be true
  end

  it 'player two is not the winner' do
    mark_board([2, 4, 6])
    user_ui = UI.new
    player_two = Player.new("O", user_ui)
    expect(board.is_a_winner?(player_two)).to be false
  end

end
