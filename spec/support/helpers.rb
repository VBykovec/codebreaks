module Codebreak
  module Helpers
    def self.included(base)
      base.let (:output) { double('output').as_null_object } 
      base.let (:input) { double('input').as_null_object } 
      base.let (:game) { Game.new(output,input, '1234') }
    end
  end
end
