class Image
  include Validators::ImageValidator

  DEFAULT_COLOUR = 'O'
  ARRAY_RANGE = 1..250
  COLOUR_RANGE = 'A'..'Z'

  def initialize m, n
    @height = m.to_i
    @width = n.to_i

    clear_or_create_bitmap
  end

  def clear_or_create_bitmap
    bitmap_size_validator

    @bitmap = Array.new(width) { Array.new(height, DEFAULT_COLOUR) }
  end

  attr_reader :width, :height, :bitmap
end
