require 'spec_helper'
describe Codebreak do
    context '#name' do
        it 'should return gem name' do
            Codebreak.name.should == 'Codebreak'
        end
    end
end
