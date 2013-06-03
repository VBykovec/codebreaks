require 'spec_helper'
module Codebreak
  describe Game do
    describe 'after game finish' do 
      it 'ask user to save score' do
        input.stub(:gets) {'1234'}
        output.should_receive(:puts).with('Save score to file (yes/no)?')
        game.start
      end
      it 'save save score to file if user answer "yes"' do
        input.stub(:gets) {'yes'}
        game.save_score
        File.exist?('score.txt').should be_true
      end
      it 'not save score to file if user not answer "yes"' do
        File.unlink('score.txt')
        input.stub(:gets) {'no'}
        game.save_score
        File.exist?('score.txt').should be_false
      end
    end
  end
end

