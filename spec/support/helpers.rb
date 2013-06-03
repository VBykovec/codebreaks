module Codebreak
  module Helpers
    def self.included(base)
      base.let (:output) { double('output').as_null_object } 
      base.let (:input) { double('input').as_null_object } 
      base.let (:secret) { '1234' }
      base.let (:game) { Game.new(output,input, secret) }
    end
  end
end
