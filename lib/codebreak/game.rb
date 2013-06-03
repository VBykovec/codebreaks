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
      @count = 0
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
      if val == 'hint'
        @output.puts "hint: secret have #{@secret.shuffle[0]}"
        return
      end
      if val == 'exit'
        @output.puts 'Exit!'
        System.exit(0)
      end

      @count += 1
      if @count == @end_turn
        @output.puts "You loose the game in #{@count} turns"    
        return
      end

      rez = ''
      val.chars.each_with_index do |c,i|
        if idx = @secret.find_index(c)
          rez +=  (i == idx) ? '+' : '-'
        end
      end
      if rez == '++++'
        @output.puts 'You win!'
        @output.puts "++++ (#{@secret.join()})"
        @output.puts "#{@count} turn"
      else
        @output.puts rez
      end
    end
  end
end
