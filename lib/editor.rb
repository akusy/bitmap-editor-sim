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

    image.colour_the_pixel(x, y, c)
  end

  private

  def check_image
    raise NoImageError, "No image bitmap" if image.nil?
  end
end
