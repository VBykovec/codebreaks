module Codebreak
  class Game
    YES_ANSWER = %w(Yes YES yes y)
    def initialize(turns = 10, output = $stdout, input = $stdin, secret = '')
      @output = output
      @end_turn = turns
      @input = input
      @secret = secret.chars || []
      @count = 0
    end
    def start
      @output.puts 'Welcome to Codebreak!'
      begin
        @output.puts 'Enter guess:'
        if @secret.empty?
          arr = (1..6).to_a.map &:to_s
          4.times {@secret.push arr.shuffle[0]}
        end

        @end_turn.times do |c|
          break if guess
          @output.puts "You loose the game in #{@count} turns" if c == @end_turn - 1
        end
      end while continue_game?
      save_score
    end

    def exit_game
      false
    end
    def guess 
      val = @input.gets()
      if val.length != 4
        @output.puts 'Wrong count of digits'
        return false
      end
      if val == 'hint'
        @output.puts "hint: secret have #{@secret.shuffle[0]}"
        return false
      end
      if val == 'exit'
        exit_game
      end

      @count += 1
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
        return true
      else
        @output.puts rez
      end
    end

    def continue_game?
      @output.puts('Play again (yes/no)?')
      if YES_ANSWER.include? @input.gets
        true
      else
        exit_game
      end
    end
    def save_score
     @output.puts 'Save score to file (yes/no)?'
     rez = @input.gets
     if YES_ANSWER.include? @input.gets
         File.open('score.txt','w') do |file|
            file.puts "Game #{@count == @end_turn ? 'win' : 'loose'} in #{@count} turns"
         end
     end
    end
  end
end
