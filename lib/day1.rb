# frozen_string_literal: true

class Day1
  DIGIT_WORDS = %w[zero one two three four five six seven eight nine].freeze

  def part1(calibration_input:)
    sum_of_calibration_values = 0
    calibration_input.sum do |calibration_input_line|
      calibration_digits = calibration_input_line.chars.grep(/\d/)
      calibration_value = "#{calibration_digits.first}#{calibration_digits.last}".to_i
      sum_of_calibration_values += calibration_value
    end

    sum_of_calibration_values
  end

  def part2(calibration_input:)
    sum_of_calibration_values = 0

    calibration_input.each do |calibration_input_line|
      first_digit = calibration_input_line.match(
        /(#{DIGIT_WORDS.join('|')}|\d)/
      ).to_s

      last_digit = calibration_input_line.reverse.match(
        /(#{DIGIT_WORDS.join('|').reverse}|\d)/
      ).to_s.reverse

      first_digit_value = DIGIT_WORDS.index(first_digit) || first_digit
      last_digit_value = DIGIT_WORDS.index(last_digit) || last_digit

      sum_of_calibration_values += "#{first_digit_value}#{last_digit_value}".to_i
    end

    sum_of_calibration_values
  end
end
