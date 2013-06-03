require 'spec_helper'
module Codebreak
  describe Game do
    describe "#start" do
      let (:output) { double('output').as_null_object } 
      let (:game) { Game.new(output) }
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreak!')
        game.start
      end
      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
      end
    end
  end
end
