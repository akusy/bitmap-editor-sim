class Editor
  attr_reader :image

  def create_image m, n
    @image = Image.new(m, n)
  end
end
