require 'rspec'
require 'core/flow'
require 'core/board'
require 'o_stream_catcher'
require 'stringio'
require 'UI/UI'

describe Flow do

  before(:each) do
    @board = Board.new(3)
    @string_io = StringIO.new
  end

  it 'can not place a symbol if the cell is not empty' do
    @board.mark(3, "X")
    @string_io.puts 4
    @string_io.rewind
    ui = UI.new($stdout, @string_io)
    flow = Flow.new(ui, @board)
    ui.show_grid(@board)
    flow.play
    expect(@string_io.string).to eq("Please choose a different position where the cell is empty")
  end
end
