class Cli

  def initialize input
    @input = input
    @argv = commands
  end

  def call
    return 'break' if argv[0] == 'X'
  end

  private

  attr_reader :input, :argv

  def commands
    input.split(' ')
  end
end
