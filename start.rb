#!/usr/bin/env ruby

require_relative 'config'
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
