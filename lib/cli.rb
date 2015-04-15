class Cli
  include Validators::CliValidator

  def initialize
    @editor = Editor.new
  end

  def call input
    @argv = commands(input)

    case argv[0]
    when 'I'
      create_image_command
    when 'C'
      clear_the_table_command
    when 'L'
      colour_the_pixel_command
    when 'V'
      draw_vertical_segment_command
    when 'H'
      draw_horizontal_segment_command
    when 'F'
      fill_the_region_command
    when 'S'
      show_current_image_command
    when 'T'
      transpose_image_command
    when 'X'
      return 'break'
    else
      p "Unrecognized command"
    end
  end

  private

  attr_reader :input, :argv, :editor

  def commands input
    input.split(' ').map { |el| /\A\d+\z/.match(el) ? el.to_i : el }
  end

  def create_image_command
    create_image_command_validator(argv)

    editor.create_image(argv[1], argv[2])
  end

  def clear_the_table_command
    editor.clear_image
  end

  def show_current_image_command
    editor.print_image
  end

  def colour_the_pixel_command
    colour_the_pixel_command_validator(argv)

    editor.colour_the_pixel(argv[1], argv[2], argv[3])
  end

  def fill_the_region_command
    colour_the_pixel_command_validator(argv)

    editor.fill_the_region(argv[1], argv[2], argv[3])
  end

  def draw_vertical_segment_command
    draw_segment_command_validator(argv)

    editor.draw_vertical_segment(argv[1], argv[2], argv[3], argv[4])
  end

  def draw_horizontal_segment_command
    draw_segment_command_validator(argv)

    editor.draw_horizontal_segment(argv[1], argv[2], argv[3], argv[4])
  end

  def transpose_image_command
    editor.transpose
  end
end
