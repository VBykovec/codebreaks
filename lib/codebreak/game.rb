module Codebreak
  class Game
    def initialize(output = $stdout, input = $stdin, secret = nil)
      @output = output
      @input = input
      @secret = secret || ''
      if @secret == ''
        arr = (1..6).to_a
        4.times { @secret = @secret + arr.shuffle[0].to_s }
     end
    end
    def start
      @output.puts 'Welcome to Codebreak!'
      @output.puts 'Enter guess:'
    end
  end
end
