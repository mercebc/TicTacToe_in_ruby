require 'rspec'
require 'core/cell'

describe Cell do

  it 'is empty when its initialized' do
    expect(Cell.new().content).to eq(nil)
  end

  it 'can check that its content is empty by default' do
    expect(Cell.new().is_empty?).to eq(true)
  end

  it 'can check that its content is not empty after adding a value to it' do
    new_cell = Cell.new()
    new_cell.content = "X"
    expect(new_cell.is_empty?).to eq(false)
  end

end
