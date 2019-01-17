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
    expect(ui.get_position(board)).to eq(0)
  end

  it 'shows error if user introduces a position higher than capacity' do
    user_input = StringIO.new("10\n3")
    ui = UI.new(output, user_input)
    expect(ui.get_position(board)).to eq(2)
    expect(output.string).to eq("Please insert a valid position: ")
  end

  it 'shows error if user introduces a position thats already taken' do
    user_input = StringIO.new("6\n3")
    ui = UI.new(output, user_input)
    board.mark(5, "X")
    expect(ui.get_position(board)).to eq(2)
    expect(output.string).to eq("Please insert a valid position: ")
  end

  it 'shows error if user doesnt introduce a valid number' do
    user_input = StringIO.new("s\n3")
    ui = UI.new(output, user_input)
    expect(ui.get_position(board)).to eq(2)
    expect(output.string).to eq("Please insert a valid position: ")
  end

  it 'can ask the user to introduce a mode' do
    user_input = StringIO.new("h")
    ui = UI.new(output, user_input)
    expect(ui.get_mode).to eq("h")
  end

  it 'shows error if user doesnt introduce a valid mode' do
    user_input = StringIO.new("j\nH")
    ui = UI.new(output, user_input)
    expect(ui.get_mode).to eq("h")
    expect(output.string).to include("The option is not valid. ")
  end

  it 'can display an error message' do
    ui = UI.new(output, StringIO.new)
    ui.display_message("Error message")
    expect(output.string).to eq("Error message")
  end

  it 'can show the grid' do
    ui = UI.new(output, StringIO.new)
    board.mark(3,"X")
    ui.display_grid(board)
    expect(output.string).to eq(" 1 | 2 | 3 \n---+---+---\n X | 5 | 6 \n---+---+---\n 7 | 8 | 9 \n")
  end

  it 'announces a tie' do
    ui = UI.new(output, StringIO.new)
    ui.announce_tie
    expect(output.string).to eq("It's a tie")
  end

  it 'announces winner X' do
    ui = UI.new(output, StringIO.new)
    player = Human.new("X", UI.new)
    ui.announce_winner(player)
    expect(output.string).to eq("X has won")
  end

end
