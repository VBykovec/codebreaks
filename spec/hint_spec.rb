require 'spec_helper'
module Codebreak
  describe Game do
    describe '#guess' do 
      it 'send hint if "hint" received' do
        input.stub(:gets){'hint'}
        output.should_receive(:puts).with(/hint: secret have \d/)
        game.guess
      end
    end
  end
end

