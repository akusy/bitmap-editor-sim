require 'spec_helper'

describe Validators::CliValidator do
  let!(:dummy_class) { DummyClass.new }

  describe "#create_image_command_validator" do

    context "When arguments are valid" do
      it 'returns nil' do
        expect(dummy_class.create_image_command_validator(["I", 1, 2])).to be_falsey
      end
    end

    context "When arguments are invalid" do
      it 'raises exception' do
        expect { dummy_class.create_image_command_validator([]) }.to raise_exception(IncorrectArgumentCommandError)
        expect { dummy_class.create_image_command_validator(["I", "2"]) }.to raise_exception(IncorrectArgumentCommandError)
        expect { dummy_class.create_image_command_validator(["I", "2", "A"]) }.to raise_exception(IncorrectArgumentCommandError)
      end
    end

  end

  describe "#colour_the_pixel_command_validator" do

    context "When arguments are valid" do
      it 'returns nil' do
        expect(dummy_class.colour_the_pixel_command_validator(["L", 1, 2, "Z"])).to be_falsey
      end
    end

    context "When arguments are invalid" do
      it 'raises exception' do
        expect { dummy_class.colour_the_pixel_command_validator([]) }.to raise_exception(IncorrectArgumentCommandError)
        expect { dummy_class.colour_the_pixel_command_validator(["L", "2", "3"]) }.to raise_exception(IncorrectArgumentCommandError)
        expect { dummy_class.colour_the_pixel_command_validator(["L", "2", "A"]) }.to raise_exception(IncorrectArgumentCommandError)
      end
    end

  end

  describe "#draw_segment_command_validator" do

    context "When arguments are valid" do
      it 'returns nil' do
        expect(dummy_class.draw_segment_command_validator(["V", 3, 1, 2, "Z"])).to be_falsey
      end
    end

    context "When arguments are invalid" do
      it 'raises exception' do
        expect { dummy_class.draw_segment_command_validator([]) }.to raise_exception(IncorrectArgumentCommandError)
        expect { dummy_class.draw_segment_command_validator(["V", "2", "3"]) }.to raise_exception(IncorrectArgumentCommandError)
        expect { dummy_class.draw_segment_command_validator(["V", "2", "1", "A"]) }.to raise_exception(IncorrectArgumentCommandError)
      end
    end

  end
end
