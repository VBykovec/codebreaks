module Codebreak
  class Game
    def initialize(output = $stdout)
      @output = output
    end
    def start
      @output.puts 'Welcome to Codebreak!'
      @output.puts 'Enter guess:'
    end
  end
end
