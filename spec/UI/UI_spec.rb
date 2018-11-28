require 'rspec'
require 'UI/UI'
require 'core/board'

describe UI do

  let(:user_input) { StringIO.new }
  let(:output) { StringIO.new }

  it 'can ask the user to introduce a symbol' do
    user_input = StringIO.new("X")
    ui = UI.new(output, user_input)
    expect(ui.get_symbol).to eq("X")
  end

  it 'can ask the user to introduce a position' do
    user_input = StringIO.new("1")
    ui = UI.new(output, user_input)
    expect(ui.get_position).to eq(0)
  end

  it 'can display an error message' do
    user_input = StringIO.new
    ui = UI.new(output, user_input)
    ui.show_error_message("Error message")
    expect(output.string).to eq("Error message")
  end

  it 'can show the grid' do
    user_input = StringIO.new
    ui = UI.new(output, user_input)
    board = Board.new(3)
    board.mark(3,"X")
    ui.show_grid(board)
    expect(output.string).to eq("   |   |   \n---+---+---\n X |   |   \n---+---+---\n   |   |   \n")
  end

end
