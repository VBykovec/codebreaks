require 'bundler/setup'
require 'support/helpers'
require 'codebreak'

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation # :progress, :html, :textmate
  config.include Codebreak::Helpers
end

