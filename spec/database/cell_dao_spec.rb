require 'rspec'
require 'database/cell_dao'
require 'pg_tester'

describe CellDAO do

  psql = PgTester.new({
    database: "tictactoe_test",
    user: "ttt",
    })

  psql.setup

  psql.exec("CREATE TABLE cell (id SERIAL PRIMARY KEY, game_id INTEGER, position INTEGER, content VARCHAR(5));")

  let(:connection) { PG.connect(:dbname => psql.database, :user => psql.user) }

  it 'inserts a new cell in game with id 1' do
    cell = CellDAO.new(nil, 3, "X")
    cell.insert(1, connection)
    expect(cell.id).to_not be(nil)
  end

  it 'gets all the cells for the board 1' do
    cell = CellDAO.new(nil, 5, "O")
    cell.insert(1, connection)

    cells = CellDAO.all(1, connection)
    expect(cells.length).to eq(2)
  end

  psql.teardown
end
