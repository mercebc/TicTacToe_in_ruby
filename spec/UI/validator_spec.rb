require 'rspec'
require 'UI/UI'
require 'core/board'
require 'UI/Validator'

describe Validator do

  let(:board) { Board.new(3) }
  let(:validator) { Validator.new }

  it 'game mode option is invalid' do
    expect(validator.valid_mode?("t")).to eq(false)
  end

  it 'game mode option "e" is valid' do
    expect(validator.valid_mode?("e")).to eq(true)
  end

  it 'game mode option "H" is valid' do
    expect(validator.valid_mode?("H")).to eq(true)
  end

  it 'game mode option "H" is valid' do
    expect(validator.valid_mode?("H")).to eq(true)
  end

  it 'position is valid' do
    expect(validator.valid_move?("2", board)).to eq(true)
  end

  it 'position is not between the capacity of the board' do
    expect(validator.valid_move?("23", board)).to eq(false)
  end

  it 'position is already been chosen' do
    board.mark(3,"X")
    expect(validator.valid_move?("4", board)).to eq(false)
  end

end
