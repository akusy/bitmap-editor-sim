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

  describe "#initialize" do

    context "When image size less or equal 250" do

      it "assigns width, height and" do
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

end
