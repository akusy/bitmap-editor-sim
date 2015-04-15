require 'spec_helper'

describe Image do
  let(:image) { Image.new(2, 3) }

  let(:new_bitmap) do
    [ ["O", "O", "O"],
      ["O", "O", "O"] ]
  end

  let(:edited_bitmap) do
    [ ["O", "H", "O"],
      ["O", "H", "O"] ]
  end

  let(:horrizontaly_edited_bitmap) do
    [ ["O", "O", "O"],
      ["O", "R", "R"] ]
  end

  describe "#initialize" do

    context "When image size less or equal 250" do
      it "assigns width, height and bitmap" do
        expect(image.width).to eq 2
        expect(image.height).to eq 3
        expect(image.bitmap).to eq new_bitmap
      end
    end

    context "When image size has exceeded" do
      it "raises BitmapSizeError" do
        expect { Image.new(251, 1) }.to raise_exception(BitmapSizeError)
        expect { Image.new(1, 251) }.to raise_exception(BitmapSizeError)
        expect { Image.new(1, 0) }.to raise_exception(BitmapSizeError)
        expect { Image.new(0, 1) }.to raise_exception(BitmapSizeError)
      end
    end

  end

  describe "#clear_or_create_bitmap" do
    before do
      image.instance_variable_set(:@bitmap, edited_bitmap)
      image.clear_or_create_bitmap
    end

    it "replaces edited bitmap with new one" do
      expect(image.bitmap).to eq new_bitmap
    end
  end

  describe "#print_bitmap" do
    it "prints image" do
      expectation = "OOO\nOOO\n"

      expect($stdout).to receive(:print).with(expectation)

      image.print_bitmap
    end
  end

  describe "#colour_the_pixel" do

    context "When pixel coords are within image size range" do
      it "changes pixel colour" do
        image.colour_the_pixel(1, 2, 'I')

        expect(image.bitmap[1][2]).to eq "I"
      end
    end

    context "When pixel coords are outside image size range" do
      it "raises BitmapSizeError" do
        expect { image.colour_the_pixel(112, 2, 'I') }.to raise_exception(BitmapSizeError)
      end
    end

  end

  describe "#fill_the_region" do

    context "When pixel coords are within image size range" do
      before do
        image.colour_the_pixel(0, 1, 'W')
        image.colour_the_pixel(1, 1, 'W')
      end

      it "changes region colour" do
        image.fill_the_region(0, 1, 'H')

        expect(image.bitmap).to eq edited_bitmap
      end
    end

    context "When pixel coords are outside image size range" do
      it "raises BitmapSizeError" do
        expect { image.fill_the_region(112, 2, 'I') }.to raise_exception(BitmapSizeError)
      end
    end

  end

  describe "#draw_horizontal_segment" do

    context "When pixels coords are within image size range" do
      it "draws horizontal segment" do
        image.draw_horizontal_segment(1, 2, 1, "R")

        expect(image.bitmap).to eq horrizontaly_edited_bitmap
      end
    end

    context "When pixels coords are outside image size range" do
      it "raises BitmapSizeError" do
        expect { image.draw_horizontal_segment(112, 1, 1, 'I') }.to raise_exception(BitmapSizeError)
        expect { image.draw_horizontal_segment(1, 1, 112, 'I') }.to raise_exception(BitmapSizeError)
        expect { image.draw_horizontal_segment(1, 112, 1, 'I') }.to raise_exception(BitmapSizeError)
      end
    end

  end

  describe "#draw_vertical_segment" do

    context "When pixels coords are within image size range" do
      it "draws vertical segment" do
        image.draw_vertical_segment(1, 0, 1, "H")

        expect(image.bitmap).to eq edited_bitmap
      end
    end

    context "When pixels coords are outside image size range" do
      it "raises BitmapSizeError" do
        expect { image.draw_horizontal_segment(112, 1, 1, 'I') }.to raise_exception(BitmapSizeError)
        expect { image.draw_horizontal_segment(1, 1, 112, 'I') }.to raise_exception(BitmapSizeError)
        expect { image.draw_horizontal_segment(1, 112, 1, 'I') }.to raise_exception(BitmapSizeError)
      end
    end
  end
end
