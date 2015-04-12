module Validators
  module CliValidator

    def create_image_command_validator argv
      unless /\A\d+\z/.match(argv[1]) && /\A\d+\z/.match(argv[2])
        raise CreateImageCommandError, 'Incorrect command arguments'
      end
    end


  end
end
