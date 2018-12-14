require 'rspec'
require 'core/cell'
require 'UI/UI'
require 'core/players/easy_computer'
require 'core/players/human'

describe Cell do

  let(:my_cell) { Cell.new() }

  it 'is empty when its initialized' do
    expect(Cell.new().content).to be(nil)
  end

  it 'can check that its content is empty by default' do
    expect(Cell.new().is_empty?).to be(true)
  end

  it 'can check that its content is not empty after adding a value to it' do
    my_cell.content = "X"
    expect(my_cell.is_empty?).to be(false)
  end

  it 'belongs to a player' do
    user_ui = UI.new
    my_player = Human.new("X", user_ui)
    my_cell.content = "X"
    expect(my_cell.belongs_to?(my_player)).to be(true)
  end

  it 'doesnt belong to a player' do
    my_player = EasyComputer.new("X")
    my_cell.content = "O"
    expect(my_cell.belongs_to?(my_player)).to be(false)
  end
end
