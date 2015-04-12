module Validators
  module ImageValidator

    def bitmap_size_validator
      unless Image::ARRAY_RANGE.include?(width) && Image::ARRAY_RANGE.include?(height)
        raise BitmapSizeError
      end
    end


  end
end
