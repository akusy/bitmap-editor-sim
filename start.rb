#!/usr/bin/env ruby

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default)

require_all 'lib'

cli = Cli.new
loop do
  print "> "
  input = gets.chomp

  begin
    break if cli.call(input) == 'break'
  rescue ImageError, CliError  => e
    p "Error: #{e.message}"
  end
end
