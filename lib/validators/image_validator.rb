module Validators
  module ImageValidator

    def bitmap_size_validator
      unless ARRAY_RANGE.include?(width) && ARRAY_RANGE.include?(height)
        raise BitmapSizeError
      end
    end


  end
end
