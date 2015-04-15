require_relative '../config'
require_all 'lib'

class DummyClass
  include Validators::CliValidator
  include Validators::ImageValidator
end
