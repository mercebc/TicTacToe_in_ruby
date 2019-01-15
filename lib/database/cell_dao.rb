require 'pg'

class CellDAO
  attr_reader :id, :position, :content

  def initialize(id, position, content)
    @id = id
    @position = position
    @content = content
  end

  def self.all(game_id, connection)
    cells = Array.new
    results = connection.exec_params("SELECT * FROM cell WHERE game_id = $1", [game_id])
    return nil unless results.values.length > 0
    results.each do |result|
      id = result['id']
      position = result['position'].to_i
      content = result['content']
      cell = self.new(id, position, content)
      cells << cell
    end
    cells
  end

  def insert(game_id, connection)
    result = connection.exec_params("INSERT INTO cell (game_id, position, content) VALUES ($1, $2, $3) RETURNING id", [game_id, position, content])
    @id = result.first['id'].to_i if result.first['id']
  end

end
