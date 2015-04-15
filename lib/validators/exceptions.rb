#=== Image creation errors ===
class ImageError < ArgumentError
end

class BitmapSizeError < ImageError
end

class NoImageError < ImageError
end


#=== Command line errors ===
class CliError < ArgumentError
end

class CreateImageCommandError < CliError
end

class ColourThePixelCommandError < CliError
end
