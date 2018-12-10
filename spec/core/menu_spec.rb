require 'rspec'
require 'core/Menu'
require 'UI/UI'

describe Menu do

  it 'creates human-human players' do
    mode = 'h'
    ui = UI.new
    menu = Menu.new(ui)
    players = menu.create_players(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(Human)
  end

  it 'creates human-computer players' do
    mode = 'e'
    ui = UI.new
    menu = Menu.new(ui)
    players = menu.create_players(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(EasyComputer)
  end

end
