require 'spec_helper'
module Codebreak
  describe Game do
    describe 'loses in game' do 
      it 'must lost after 10th guess of turn' do
        input.stub(:gets){'1111'}
        output.should_receive(:puts).with(/You loose the game in \d+ turns/)
        10.times { game.guess }
      end
    end
  end
end

