require 'rspec'
require 'cell'

describe Cell do

  it 'create a cell' do
    expect(Cell.new()).to be_a(Cell)
  end

  it 'has a symbol and it is empty by default' do
    expect(Cell.new().symbol).to eq(" ")
  end

end
