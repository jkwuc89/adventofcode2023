# frozen_string_literal: true

require 'day2'

describe Day2 do
  let(:day2) { described_class.new }

  let(:example_input) do
    [
      'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green',
      'Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue',
      'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green,1 red',
      'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red',
      'Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'
    ]
  end

  let(:file_input) { File.readlines('input/day2.txt') }

  describe '#part1' do
    context 'with example input' do
      it { expect(day2.part1(game_input: example_input)).to eq(8) }
    end

    context 'with puzzle input file' do
      it { expect(day2.part1(game_input: file_input)).to eq(2176) }
    end

  end

  describe '#part2' do
    context 'with example input' do
      it { expect(day2.part2(game_input: example_input)).to eq(2286) }
    end

    context 'with puzzle input file' do
      it { expect(day2.part2(game_input: file_input)).to eq(63700) }
    end
  end
end
