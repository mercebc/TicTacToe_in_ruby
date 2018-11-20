require 'rspec'
require 'UI/GameUI'
require 'core/board'

describe GameUI do
  it 'user is asked to introduce a mark' do
    ui = GameUI.new()
    expect(ui.get_symbol()).not_to be_nil
  end

end
