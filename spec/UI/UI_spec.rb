require 'rspec'
require 'UI/UI'
require 'core/board'
require 'stringio'
require 'o_stream_catcher'

describe UI do

  before(:each) do
    @string_io = StringIO.new
  end

  it 'can ask the user to introduce a symbol' do
    result, stdout, stderr = OStreamCatcher.catch do
    @string_io.puts 'X'
    @string_io.rewind
    ui = UI.new($stdout, @string_io)
    expect(ui.get_symbol).to eq("X")
    end
  end

  it 'can ask the user to introduce a position' do
    result, stdout, stderr = OStreamCatcher.catch do
    @string_io.puts 2
    @string_io.rewind
    ui = UI.new($stdout, @string_io)
    expect(ui.get_position).to eq(1)
    end
  end

  it 'can display an error message' do
    result, stdout, stderr = OStreamCatcher.catch do
    ui = UI.new(@string_io, $stdin)
    ui.show_error_message("Error message")
    expect(@string_io.string).to eq("Error message")
    end
  end

  it 'can show the grid' do
    result, stdout, stderr = OStreamCatcher.catch do
    ui = UI.new(@string_io, $stdin)
    board = Board.new(3)
    board.mark(3,"X")
    ui.show_grid(board)
    expect(@string_io.string).to eq("   |   |   \n---+---+---\n X |   |   \n---+---+---\n   |   |   \n")
    end
  end

end
