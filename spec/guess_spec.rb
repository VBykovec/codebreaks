require 'spec_helper'
module Codebreak
  describe Game do
    describe '#guess' do 
      it 'submit guess'
      it 'show "" if no matched'
      it 'show "++" if full matched two digit'
      it 'show "--" if matched two digit'
      it 'show "++--" if matched two digit and two not in place'
      it 'show "+" if matched one digit'
    end
  end
end

