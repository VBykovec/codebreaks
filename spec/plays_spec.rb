require 'spec_helper'
module Codebreak
  describe Game do
    after(:each) { game.start }
    describe 'plays again' do 
      it 'after won should ask to play again' do
        input.stub(:gets) {'1234'}
        output.should_receive(:puts).with('Play again (yes/no)?')
      end
      it 'after won prompt to play again' do
        input.stub(:gets) {'1234'}
        game.should_receive(:continue_game?)
      end
      it 'after lost prompt to play again' do
        input.stub(:gets) {'1111'}
        output.should_receive(:puts).with('Play again (yes/no)?')
      end
      it 'play again if user answer "yes"' do 
        input.stub(:gets) {'1234'}
        game.stub(:continue_game?) { false }
        output.should_receive(:puts).with('Enter guess:')
      end
      it 'exit if user answer "no"' do
        input.stub(:gets) {'1234'}
        game.should_receive(:exit_game)
      end
    end
  end
end

