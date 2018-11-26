require 'rspec'
require 'UI/GameUI'
require 'core/board'
require 'stringio'
require 'o_stream_catcher'

describe GameUI do

  before(:each) do
    @string_io = StringIO.new
  end

  it 'can ask the user to introduce a symbol' do
    result, stdout, stderr = OStreamCatcher.catch do
    @string_io.puts 'X'
    @string_io.rewind
    ui = GameUI.new($stdout, @string_io)
    expect(ui.get_symbol).to eq("X")
    end
  end

  it 'can show the grid' do
    result, stdout, stderr = OStreamCatcher.catch do
    ui = GameUI.new(@string_io, $stdin)
    board = Board.new(3)
    board.mark(3,"X")
    ui.show_grid(board)
    expect(@string_io.string).to eq("   |   | X \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n")
    end
  end

end
