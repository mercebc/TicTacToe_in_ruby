require 'rspec'
require 'core/Menu'

describe Menu do

  it 'creates human-human players' do
    mode = 'h'
    menu = Menu.new
    players = menu.create_players(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(Human)
  end

  it 'creates human-computer players' do
    mode = 'e'
    menu = Menu.new
    players = menu.create_players(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(Easy_computer)
  end

end
