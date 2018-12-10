require 'rspec'
require 'core/players/playerFactory'
require 'UI/UI'
require 'core/players/human'
require 'core/players/easyComputer'

describe PlayerFactory do

  let(:player_factory) { PlayerFactory.new }

  it 'creates a Human' do
    user_ui = UI.new
    expect(player_factory.build(:human,"X",user_ui)).to be_a(Human)
  end

  it 'creates an Easy_computer' do
    expect(player_factory.build(:easy_computer,"X")).to be_a(EasyComputer)
  end

end
