require 'rspec'
require 'database/game_dao'

describe GameDAO  do

  let(:connection) { PG.connect(dbname: 'tictactoe', user: 'ttt', password:'tictactoe') }

  it 'inserts a new game in the db' do
    game = GameDAO.new(nil, "merce", 3, "h", "O")
    game.insert(connection)
    expect(game.id).to_not be(nil)
  end

  it 'finds a game with the name' do
    expect(GameDAO.find("merce", connection)).to_not be(nil)
  end

  it 'finds all the games of the db' do
    game = GameDAO.new(nil, "my_game", 3, "e", "O")
    game.insert(connection)
    expect(GameDAO.all(connection).length).to eq(2)
  end

  it 'deletes a game from the db' do
    GameDAO.delete("my_game",connection)
    expect(GameDAO.find("my_game", connection)).to be(nil)
  end

end
