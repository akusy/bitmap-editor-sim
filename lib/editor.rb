class Editor
  attr_reader :image

  def create_image m, n
    @image = Image.new(m, n)
  end

  def clear_image
    raise NoImageError unless image.present?

    image.clear_or_create_bitmap
  end
end
