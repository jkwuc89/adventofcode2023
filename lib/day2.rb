# frozen_string_literal: true

class Day2
  MAX_RED_CUBES = 12
  MAX_GREEN_CUBES = 13
  MAX_BLUE_CUBES = 14

  def part1(game_input:)
    possible_game_ids = game_input.map do |game_input_line|
      game_id(game_input_line) if game_possible?(game_input_line)
    end

    possible_game_ids.compact.sum
  end

  def part2(game_input:)
    color_powers = game_input.map do |game_input_line|
      minimum_cubes_per_color = minimum_cubes_per_color(game_input_line)
      minimum_cubes_per_color[:red] * minimum_cubes_per_color[:green] * minimum_cubes_per_color[:blue]
    end

    color_powers.sum
  end

  private

  def game_id(game_input_line)
    game_input_line.split(':').first.match(/Game (\d+)/)[1].to_i
  end

  def game_possible?(game_input_line)
    all_cubes_pulled = game_input_line.split(':').last.split(';')
    all_cubes_pulled.all? do |cubes_pulled|
      cubes_pulled.split(',').all? do |count_and_color|
        cube_count = count_and_color.strip.split.first.to_i
        cube_color = count_and_color.strip.split.last
        case cube_color
        when 'red'
          cube_count <= MAX_RED_CUBES
        when 'green'
          cube_count <= MAX_GREEN_CUBES
        when 'blue'
          cube_count <= MAX_BLUE_CUBES
        end
      end
    end
  end

  def minimum_cubes_per_color(game_input_line)
    all_cubes_pulled = game_input_line.split(':').last.split(';').join

    min_red_cubes_needed = all_cubes_pulled.scan(/(\d+) red/).flatten.map(&:to_i).max
    min_green_cubes_needed = all_cubes_pulled.scan(/(\d+) green/).flatten.map(&:to_i).max
    min_blue_cubes_needed = all_cubes_pulled.scan(/(\d+) blue/).flatten.map(&:to_i).max

    {
      red: min_red_cubes_needed,
      green: min_green_cubes_needed,
      blue: min_blue_cubes_needed
    }
  end
end
