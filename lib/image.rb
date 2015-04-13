class Image
  include Validators::ImageValidator

  DEFAULT_COLOUR = 'O'
  ARRAY_RANGE = 1..250
  COLOUR_RANGE = 'A'..'Z'

  attr_reader :width, :height, :bitmap

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

  def colour_the_pixel x, y, colour
    bitmap_range_excess_validator(x, y)

    bitmap[x-1][y-1] = colour
  end

  def fill_the_region x, y, colour
    bitmap_range_excess_validator(x, y)

    old_colour = bitmap[x-1][y-1]
    bitmap[x-1][y-1] = colour

    @neighbours_map = Array.new

    neighbours_map.push([x-1, y-1])

    while neighbours_map.size > 0
      check_and_colour_neighbours(colour, old_colour)
    end
  end

  private

  attr_reader :neighbours_map

  def check_and_colour_neighbours colour, old_colour
    coords = neighbours_map.pop

    x = coords[0]
    y = coords[1]

    bitmap[x][y] = colour

    if (x-1) >= 0 && bitmap[x-1][y] == old_colour
      neighbours_map.push([x-1, y])
    end

    if (x+1) < width && bitmap[x+1][y] == old_colour
      neighbours_map.push([x+1, y])
    end

    if (y-1) >= 0 && bitmap[x][y-1] == old_colour
      neighbours_map.push([x, y-1])
    end

    if (y+1) < height && bitmap[x][y+1] == old_colour
      neighbours_map.push([x, y+1])
    end
  end

end
