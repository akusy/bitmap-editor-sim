module Validators
  module ImageValidator

    def bitmap_size_validator width, height
      unless Image::ARRAY_RANGE.include?(width) && Image::ARRAY_RANGE.include?(height)
        raise BitmapSizeError
      end
    end

    def bitmap_range_excess_validator width, height, x, y
      unless x.between?(0, width-1) && y.between?(0, height-1)
        raise BitmapSizeError, "Image size has been exceeded"
      end
    end

  end
end
