class Image
  include Validators::ImageValidator

  DEFAULT_COLOUR = 'O'
  ARRAY_RANGE = 1..250
  COLOUR_RANGE = 'A'..'Z'

  def initialize m, n
    @width = m
    @height = n

    clear_or_create_bitmap
  end

  def clear_or_create_bitmap
    bitmap_size_validator

    @bitmap = Array.new(width) { Array.new(height, DEFAULT_COLOUR) }
  end

  def print_bitmap
    bitmap.each do |row|
      row.each do |pixel|
        print pixel
      end
      print "\n"
    end
  end

  def colour_the_pixel x, y, c
    bitmap_range_excess_validator(x, y)

    bitmap[x-1][y-1] = c
  end

  attr_reader :width, :height, :bitmap
end
