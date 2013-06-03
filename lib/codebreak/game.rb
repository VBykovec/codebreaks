module Codebreak
  class Game
    def initialize(output = $stdout, input = $stdin, secret = '')
      @output = output
      @input = input
      @secret = secret.chars || []
      if @secret.empty?
        arr = (1..6).to_a.map &:to_s
        4.times {@secret.push arr.shuffle[0]}
      end
    end
    def start
      @output.puts 'Welcome to Codebreak!'
      @output.puts 'Enter guess:'
    end
    def guess 
      val = @input.gets()
      if val.length != 4
        @output.puts 'Wrong count of digits'
        return
      end
      rez = ''
      val.chars.each_with_index do |c,i|
        @secret.each_with_index do |s,idx|
          if c == s
            rez +=  (i == idx) ? '+' : '-'
            break;
          end
        end
      end
      @output.puts rez
    end
  end
end
