module Validators
  module ImageValidator

    def bitmap_size_validator
      unless Image::ARRAY_RANGE.include?(width) && Image::ARRAY_RANGE.include?(height)
        raise BitmapSizeError
      end
    end

    def bitmap_range_excess_validator x, y
      unless x.between?(1, width) && y.between?(1, height)
        raise BitmapSizeError, "Image size has been exceeded"
      end
    end

  end
end
