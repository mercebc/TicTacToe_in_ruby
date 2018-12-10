require 'rspec'
require 'UI/UI'
require 'core/board'

describe UI do

  let(:output) { StringIO.new }
  let(:board) { Board.new(3) }

  def mark_board(marks, symbol)
    marks.each do |position|
      board.mark(position, symbol)
    end
  end

  it 'can ask the user to introduce a position' do
    user_input = StringIO.new("1")
    ui = UI.new(output, user_input)
    expect(ui.get_position).to eq(0)
  end

  it 'can ask the user to introduce a mode' do
    user_input = StringIO.new("h")
    ui = UI.new(output, user_input)
    expect(ui.get_game_mode).to eq("h")
  end

  it 'can display an error message' do
    ui = UI.new(output, StringIO.new)
    ui.show_error_message("Error message")
    expect(output.string).to eq("Error message")
  end

  it 'can show the grid' do
    ui = UI.new(output, StringIO.new)
    board.mark(3,"X")
    ui.show_grid(board)
    expect(output.string).to eq("   |   |   \n---+---+---\n X |   |   \n---+---+---\n   |   |   \n")
  end

  it 'announces a tie' do
    ui = UI.new(output, StringIO.new)
    players = [Human.new("X", ui), Easy_computer.new("O")]
    mark_board([0,2,4,7],"X")
    mark_board([1,3,5,6,8],"O")
    ui.announce_results(board, players)
    expect(output.string).to eq("It's a tie")
  end

  it 'announces winner X' do
    ui = UI.new(output, StringIO.new)
    players = [Human.new("X", ui), Human.new("O", ui)]
    mark_board([0,1,2],"X")
    ui.announce_results(board, players)
    expect(output.string).to eq("X has won")
  end

  it 'announces winner O' do
    ui = UI.new(output, StringIO.new)
    players = [Human.new("X", ui), Easy_computer.new("O")]
    mark_board([0,4,8],"O")
    ui.announce_results(board, players)
    expect(output.string).to eq("O has won")
  end

  it 'announces winner X in last move' do
    ui = UI.new(output, StringIO.new)
    players = [Human.new("X", ui), Human.new("O", ui)]
    mark_board([0,3,5,7],"O")
    mark_board([1,2,4,6,8],"X")
    ui.announce_results(board, players)
    expect(output.string).to eq("X has won")
  end
end
