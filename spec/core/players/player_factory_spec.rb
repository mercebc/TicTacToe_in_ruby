require 'rspec'
require 'core/players/player_factory'
require 'UI/UI'
require 'core/players/human'
require 'core/players/easy_computer'

describe Player_factory do

  let(:player_factory) { Player_factory.new }

  it 'creates a Human' do
    user_ui = UI.new
    expect(player_factory.build(:human,"X",user_ui)).to be_a(Human)
  end

  it 'creates an Easy_computer' do
    expect(player_factory.build(:easy_computer,"X")).to be_a(Easy_computer)
  end

end
