class Cli
  include Validators::CliValidator

  def call input
    argv = commands(input)

    case argv[0]
    when 'I'
    when 'C'
    when 'L'
    when 'V'
    when 'H'
    when 'F'
    when 'S'
    when 'X'
      return 'break'
    else
      p "Unrecognized command"
    end
  end

  private

  attr_reader :input, :argv

  def commands input
    input.split(' ')
  end
end
