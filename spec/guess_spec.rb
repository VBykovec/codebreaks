require 'spec_helper'
module Codebreak
  describe Game do
    after(:each){ game.guess }
    describe '#guess' do 
      it 'accepts 4 digit' do 
        input.stub('gets'){'1111'}
        output.should_not_receive(:puts).with('Wrong count of digits')
      end
      it 'not accepts 1..3 digit' do 
        input.stub('gets'){'111'}
        output.should_receive(:puts).with('Wrong count of digits')
      end
      it 'show "" if no matched' do
        input.stub('gets'){'5555'}
        output.should_receive(:puts).with('')
      end
        
      it 'show "++" if full matched two digit' do
        input.stub('gets'){'1255'}
        output.should_receive(:puts).with('++')
      end
      it 'show "--" if matched two digit' do
        input.stub('gets'){'5512'}
        output.should_receive(:puts).with('--')
      end
      it 'show "++--" if matched two digit and two not in place' do
        input.stub('gets'){'1243'}
        output.should_receive(:puts).with('++--')
      end
      it 'show "+" if matched one digit' do 
        input.stub('gets'){'1555'}
        output.should_receive(:puts).with('+')
      end
    end
  end
end

