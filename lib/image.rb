class Image
  include Validators::ImageValidator

  DEFAULT_COLOUR = 'O'
  ARRAY_RANGE = 1..250

  def initialize m, n
    @height = m
    @width = n

    @bitmap = create_bitmap
  end

  attr_reader :width, :height, :bitmap

  private

  def create_bitmap
    bitmap_size_validator

    Array.new(width) { Array.new(height, DEFAULT_COLOUR) }
  end
end
