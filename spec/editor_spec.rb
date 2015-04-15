require 'spec_helper'

describe Editor do
  let(:editor) { Editor.new }

  shared_context "editor with image" do
    let(:image) { double 'Image' }

    before do
      expect(editor).to receive(:check_image)
      editor.instance_variable_set(:@image, image)
    end
  end

  describe "#create_image" do
    it 'assigns Image object' do
      expect(Image).to receive(:new).with(4, 5)

      editor.create_image(4, 5)
    end
  end

  describe "#clear_image" do

    context "When image exists" do
      include_context "editor with image"

      it "clears image" do
        expect(image).to receive(:clear_or_create_bitmap)

        editor.clear_image
      end
    end

    context "When image does not exist" do
      it "raises NoImageError" do
        expect { editor.clear_image }.to raise_exception(NoImageError)
      end
    end

  end

  describe "#print_image" do

    context "When image exists" do
      include_context "editor with image"

      it "prints image" do
        expect(image).to receive(:print_bitmap)

        editor.print_image
      end
    end

    context "When image does not exist" do
      it "raises NoImageError" do
        expect { editor.print_image }.to raise_exception(NoImageError)
      end
    end

  end

  describe "#colour_the_pixel" do

    context "When image exists" do
      include_context "editor with image"

      it "colours the pixel" do
        expect(image).to receive(:colour_the_pixel).with(0, 1, 'H')

        editor.colour_the_pixel 1, 2, 'H'
      end
    end

    context "When image does not exist" do
      it "raises NoImageError" do
        expect { editor.colour_the_pixel(1, 2, 'F') }.to raise_exception(NoImageError)
      end
    end

  end

  describe "#fill_the_region" do

    context "When image exists" do
      include_context "editor with image"

      it "fills the region" do
        expect(image).to receive(:fill_the_region).with(0, 1, 'H')

        editor.fill_the_region 1, 2, 'H'
      end
    end

    context "When image does not exist" do
      it "raises NoImageError" do
        expect { editor.fill_the_region(1, 2, 'F') }.to raise_exception(NoImageError)
      end
    end

  end

  describe "#draw_horizontal_segment" do

    context "When image exists" do
      include_context "editor with image"

      it "draws horizontal segment" do
        expect(image).to receive(:draw_horizontal_segment).with(0, 1, 2, 'H')

        editor.draw_horizontal_segment 1, 2, 3, 'H'
      end
    end

    context "When image does not exist" do
      it "raises NoImageError" do
        expect { editor.draw_horizontal_segment(1, 2, 3, 'F') }.to raise_exception(NoImageError)
      end
    end

  end

  describe "#draw_vertical_segment" do

    context "When image exists" do
      include_context "editor with image"

      it "draws vertical segment" do
        expect(image).to receive(:draw_vertical_segment).with(0, 1, 2, 'H')

        editor.draw_vertical_segment 1, 2, 3, 'H'
      end
    end

    context "When image does not exist" do
      it "raises NoImageError" do
        expect { editor.draw_vertical_segment(1, 2, 3, 'F') }.to raise_exception(NoImageError)
      end
    end

  end

  describe "#transpose" do

    context "When image exists" do
      include_context "editor with image"

      it "transposes image" do
        expect(image).to receive(:transpose)

        editor.transpose
      end
    end

    context "When image does not exist" do
      it "raises NoImageError" do
        expect { editor.transpose }.to raise_exception(NoImageError)
      end
    end

  end
end
