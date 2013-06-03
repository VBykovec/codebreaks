require 'spec_helper'
module Codebreak
  describe Game do
    describe '#guess' do 
      it 'submit guess' do 
        input.stub('gets').with('1111')
        output.should_receive(:puts).with('+---')
        game.guess
      end
      it 'show "" if no matched' do
        input.stub('gets').with('5555')
        output.should_receive(:puts).with('')
        game.guess
      end
        
      it 'show "++" if full matched two digit' do
        input.stub('gets').with('1255')
        output.should_receive(:puts).with('++')
        game.guess
      end
      it 'show "--" if matched two digit' do
        input.stub('gets').with('5512')
        output.should_receive(:puts).with('--')
        game.guess
      end
      it 'show "++--" if matched two digit and two not in place' do
        input.stub('gets').with('1243')
        output.should_receive(:puts).with('++--')
        game.guess
      end
      it 'show "+" if matched one digit' do 
        input.stub('gets').with('1555')
        output.should_receive(:puts).with('+')
        game.guess
      end
    end
  end
end

