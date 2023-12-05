# frozen_string_literal: true

require 'day1'

describe Day1 do
  let(:day1) { described_class.new }

  let(:file_input) { File.readlines('input/day1.txt') }

  describe '#part1' do
    context 'with example input' do
      let(:example_input) do
        %w[
          1abc2
          pqr3stu8vwx
          a1b2c3d4e5f
          treb7uchet
        ]
      end

      it { expect(day1.part1(calibration_input: example_input)).to eq(142) }
    end

    context 'with puzzle input file' do
      it { expect(day1.part1(calibration_input: file_input)).to eq(54081) }
    end

  end

  describe '#part2' do
    context 'with example input' do
      let(:example_input) do
        %w[
          two1nine
          eightwothree
          abcone2threexyz
          xtwone3four
          4nineeightseven2
          zoneight234
          7pqrstsixteen
        ]
      end

      it { expect(day1.part2(calibration_input: example_input)).to eq(281) }
    end

    context 'with puzzle input file' do
      it { expect(day1.part2(calibration_input: file_input)).to eq(54649) }
    end
  end
end
