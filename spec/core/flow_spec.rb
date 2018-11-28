require 'rspec'
require 'core/flow'
require 'core/board'
require 'UI/UI'

describe Flow do

  before(:each) do
    @board = Board.new(3)
    @output = StringIO.new
  end

  it 'can not place a symbol if the cell is not empty' do
    @user_input = StringIO.new("1\n1\n2\n3\n4\n5\n6\n7\n8\n9")
    ui = UI.new(@output, @user_input)
    flow = Flow.new(ui, @board)
    flow.start
    expect(@output.string).to include("Please choose a different position where the cell is empty\n")
  end
end
