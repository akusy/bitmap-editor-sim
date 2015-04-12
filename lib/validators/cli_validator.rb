module Validators
  module CliValidator

    def create_image_command_validator argv
      unless is_numerical(argv[1]) && is_numerical(argv[2])
        raise CreateImageCommandError, 'Incorrect command arguments'
      end
    end

    def colour_the_pixel_validator argv
      unless is_numerical(argv[1]) && is_numerical(argv[2]) && is_capital_letter(argv[3])
        raise CreateImageCommandError, 'Incorrect command arguments'
      end
    end

    private

    def is_numerical arg
      /\A\d+\z/.match(arg.to_s)
    end

    def is_capital_letter arg
      ('A'..'Z').include?(arg)
    end
  end
end
