require 'rspec'
require 'pg'
require 'database/game_repository'
require 'core/board'
require 'UI/UI'

describe GameRepository do

  let(:test_connection) { PG.connect(dbname: 'tictactoe_test', user: 'ttt', password: 'tictactoe') }
  let(:game_repo) { GameRepository.new(test_connection) }

  def clear_table
    test_connection.exec('DELETE FROM game')
  end

  it 'writes a game in the game table' do
    clear_table
    game_repo.writeGame('mercevshimalee', 'e', 'XX__O__X_')
    result_game = test_connection.exec("SELECT * FROM game WHERE name = 'mercevshimalee'").first
    expect(result_game['name']).to eq("mercevshimalee")
  end

  it 'gets a game by its name' do
    clear_table
    test_connection.exec("INSERT INTO game (name, mode, board) VALUES ('mercevshimalee', 'e', 'XX__O__X_')")
    result_game = game_repo.readGameByName('mercevshimalee')
    expect(result_game['name']).to eq("mercevshimalee")
  end

  it 'gets the size of a board' do
    expect(game_repo.board_size('___XO_XXO')).to eq(3)
  end

  it 'loads a new board with the board from the repository' do
    board = 'XO__O__X_'
    new_board = Board.new(3)
    loaded_board = game_repo.load_new_board(board, new_board)
    expect(loaded_board.get_content(0)).to eq("X")
    expect(loaded_board.get_content(1)).to eq("O")
    expect(loaded_board.available_positions).to eq([2,3,5,6,8])
  end

  it 'gets the current player' do
    board = 'X___O__X_'
    expect(game_repo.current_player_symbol(board)).to eq("O")
  end

end
