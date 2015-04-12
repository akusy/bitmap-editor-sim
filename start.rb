#!/usr/bin/env ruby

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default)

require_all 'lib'

cli = Cli.new
loop do
  p "X - Terminate the session"

  print "> "
  input = gets.chomp

  break if cli.call(input) == 'break'
end
