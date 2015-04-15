require 'spec_helper'

describe Validators::ImageValidator do
  let!(:dummy_class) { DummyClass.new }

  describe "#bitmap_size_validator" do

    context "When arguments are valid" do
      it 'returns nil' do
        expect(dummy_class.bitmap_size_validator(1, 2)).to be_falsey
      end
    end

    context "When arguments are invalid" do
      it 'raises exception' do
        expect { dummy_class.bitmap_size_validator(Image::ARRAY_RANGE.max + 1, 1) }.to raise_exception(BitmapSizeError)
        expect { dummy_class.bitmap_size_validator(Image::ARRAY_RANGE.max, 0) }.to raise_exception(BitmapSizeError)
        expect { dummy_class.bitmap_size_validator(1, Image::ARRAY_RANGE.max + 1) }.to raise_exception(BitmapSizeError)
        expect { dummy_class.bitmap_size_validator(0, Image::ARRAY_RANGE.max) }.to raise_exception(BitmapSizeError)
      end
    end

  end

  describe "#bitmap_range_excess_validator" do

    context "When arguments are valid" do
      it 'returns nil' do
        expect(dummy_class.bitmap_range_excess_validator(2, 2, 1, 1)).to be_falsey
        expect(dummy_class.bitmap_range_excess_validator(1, 1, 0, 0)).to be_falsey
      end
    end

    context "When arguments are invalid" do
      it 'raises exception' do
        expect { dummy_class.bitmap_range_excess_validator(1, 1, 1, 1) }.to raise_exception(BitmapSizeError)
      end
    end

  end
end
