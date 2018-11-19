require 'rspec'
require 'core/cell'

describe Cell do

  it 'create a cell' do
    expect(Cell.new()).to be_a(Cell)
  end

  it 'it is empty by default' do
    expect(Cell.new().value).to eq(" ")
  end

  it 'check content of a cell is empty' do
    expect(Cell.new().is_empty?).to eq(true)
  end

end
