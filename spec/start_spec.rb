require 'spec_helper'
module Codebreak
  describe Game do
    describe "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreak!')
        game.start
      end
      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start
      end
    end
  end
end
