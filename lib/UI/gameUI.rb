class GameUI

  def initialize(stdout = $stdout, stdin = $stdin)
    @out = stdout
    @in = stdin
  end

  def get_symbol
    @out.print "Please insert your symbol\n"
    symbol = @in.gets.chomp
  end
end
