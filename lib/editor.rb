class Editor
  attr_reader :image

  def create_image m, n
    @image = Image.new(m, n)
  end

  def clear_image
    check_image

    image.clear_or_create_bitmap
  end

  def print_image
    check_image

    image.print_bitmap
  end

  def colour_the_pixel x, y, c
    check_image

    image.colour_the_pixel(x-1, y-1, c)
  end

  def fill_the_region x, y, c
    check_image

    image.fill_the_region(x-1, y-1, c)
  end

  def draw_horizontal_segment x1, x2, y, colour
    check_image

    image.draw_horizontal_segment(x1-1, x2-1, y-1, colour)
  end

  def draw_vertical_segment x, y1, y2, colour
    check_image

    image.draw_vertical_segment(x-1, y1-1, y2-1, colour)
  end

  private

  def check_image
    raise NoImageError, "No image bitmap" if image.nil?
  end
end
