require 'rspec'
require 'UI/UI'
require 'core/board'
require 'UI/Validate'

describe Validate do

  let(:board) { Board.new(3) }
  let(:validate) { Validate.new }

  it 'game mode option is invalid' do
    expect(validate.mode("t")).to eq(false)
  end

  it 'game mode option "e" is valid' do
    expect(validate.mode("e")).to eq(true)
  end

  it 'game mode option "H" is valid' do
    expect(validate.mode("H")).to eq(true)
  end

  it 'game mode option "H" is valid' do
    expect(validate.mode("H")).to eq(true)
  end

  it 'position is valid' do
    expect(validate.move("2", board)).to eq(true)
  end

  it 'position is not between the capacity of the board' do
    expect(validate.move("23", board)).to eq(false)
  end

  it 'position is already been chosen' do
    board.mark(3,"X")
    expect(validate.move("4", board)).to eq(false)
  end

end
