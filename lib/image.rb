class Image
  include Validators::ImageValidator

  DEFAULT_COLOUR = 'O'
  ARRAY_RANGE = 1..250
  COLOUR_RANGE = 'A'..'Z'

  def initialize m, n
    @width = m.to_i
    @height = n.to_i

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

  attr_reader :width, :height, :bitmap
end
