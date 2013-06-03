require 'spec_helper'
module Codebreak
  describe Game do
    after(:each) do 
      game.guess
    end
    before(:each) do
      input.stub(:gets){'1234'}
    end

    describe 'Win' do 
      it 'send congradulating message if win' do
        output.should_receive(:puts).with('You win!')
      end
      it 'show ++++ and secret code' do
        output.should_receive(:puts).with('++++ (1234)')
      end
      it 'show how many guesses take the win' do
        output.should_receive(:puts).with('1 turn')
      end
      it 'not win if guess code not the same as secret' do 
        input.stub(:gets){ '1111' }
        output.should_not_receive(:puts).with('You win!')
      end
    end
  end
end

