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
    bitmap_size_validator(width, height)

    @bitmap = Array.new(width) { Array.new(height, DEFAULT_COLOUR) }
  end

  def print_bitmap
    image_print = String.new

    bitmap.each do |row|
      row.each do |pixel|
        image_print << pixel
      end
      image_print << "\n"
    end

    $stdout.print(image_print)
  end

  def colour_the_pixel x, y, colour
    bitmap_range_excess_validator(width, height, x, y)

    bitmap[x][y] = colour
  end

  def fill_the_region x, y, colour
    bitmap_range_excess_validator(width, height, x, y)

    old_colour = bitmap[x][y]
    bitmap[x][y] = colour

    @neighbours_map = Array.new

    neighbours_map.push([x, y])

    while neighbours_map.size > 0
      check_and_colour_neighbours(colour, old_colour)
    end
  end

  def draw_horizontal_segment x1, x2, y, colour
    bitmap_range_excess_validator(width, height, y, x1)
    bitmap_range_excess_validator(width, height, y, x2)

    x1, x2 = [x1, x2].sort

    (x1..x2).each{ |i| bitmap[y][i] = colour }
  end

  def draw_vertical_segment x, y1, y2, colour
    bitmap_range_excess_validator(width, height, y1, x)
    bitmap_range_excess_validator(width, height, y2, x)

    y1, y2 = [y1, y2].sort

    (y1..y2).each{ |i| bitmap[i][x] = colour }
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
