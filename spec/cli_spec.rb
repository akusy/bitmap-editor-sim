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

    end

    context "When command is incorrect" do

      it "raises exception due to incorrect create image command" do
        expect { cli.call "I 2" }.to raise_exception(CreateImageCommandError)
      end

      it "raises exception due to exceeded image size" do
        expect { cli.call "I 251 251" }.to raise_exception(BitmapSizeError)
      end
    end
  end
end
