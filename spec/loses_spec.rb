require 'spec_helper'
module Codebreak
  describe Game do
    describe 'loses in game' do 
      it 'must lost after 10th guess of turn' do
        input.stub(:gets){'1111'}
        output.should_receive(:puts).with(/You loose the game in \d+ turns/)
        game.should_receive(:guess).at_least(10)
        game.start
      end
    end
  end
end

