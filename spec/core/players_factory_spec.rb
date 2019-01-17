require 'rspec'
require 'core/setup'
require 'UI/UI'
require 'core/players_factory'

describe PlayersFactory do

  let(:ui) { UI.new }
  let(:playersFactory) { PlayersFactory.new(ui) }

  it 'creates human-human players' do
    mode = 'h'
    players = playersFactory.build(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(Human)
  end

  it 'creates human-easy_computer players' do
    mode = 'e'
    players = playersFactory.build(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(EasyComputer)
  end

  it 'creates human-hard_computer players' do
    mode = 'i'
    players = playersFactory.build(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(HardComputer)
  end

end
