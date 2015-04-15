require 'spec_helper'

describe Cli do

  describe "#initialize" do

    it 'assigns Editor object' do
      expect(Editor).to receive(:new)

      Cli.new
    end
  end

  describe "#call" do

    let(:cli) { Cli.new }

    context "When command is correct" do

      it "calls creating image" do
        expect_any_instance_of(Editor).to receive(:create_image).with(2, 3)

        cli.call "I 2 3"
      end

      it "calls clearing table" do
        expect_any_instance_of(Editor).to receive(:clear_image)

        cli.call "C"
      end

      it "calls colouring the pixel" do
        expect_any_instance_of(Editor).to receive(:colour_the_pixel).with(2, 3, 'H')

        cli.call "L 2 3 H"
      end

      it "calls filling the region" do
        expect_any_instance_of(Editor).to receive(:fill_the_region).with(2, 3, 'I')

        cli.call "F 2 3 I"
      end
    end

    context "When command is incorrect" do

      it "raises exception due to incorrect create image command" do
        expect { cli.call "I 2" }.to raise_exception(CreateImageCommandError)
      end

      it "raises exception due to exceeded image size" do
        expect { cli.call "I 251 251" }.to raise_exception(BitmapSizeError)
      end

      it "raises exception due to incorrect colour the pixel command" do
        expect { cli.call "L 2 3" }.to raise_exception(ColourThePixelCommandError)
      end

      it "raises exception due to incorrect fill the region command" do
        expect { cli.call "F 2 3" }.to raise_exception(ColourThePixelCommandError)
      end
    end
  end
end
