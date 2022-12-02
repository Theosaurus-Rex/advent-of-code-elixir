defmodule Y2022.Day02 do
  @rock "X"
  @paper "Y"
  @scissors "Z"

  @elf_rock "A"
  @elf_paper "B"
  @elf_scissors "C"

  @lose "X"
  @draw "Y"
  @win "Z"

  def run_part_1_game() do
    input_to_pairs()
    |> get_round_results_part_1()
    |> Enum.sum()
  end

  def run_part_2_game() do
    input_to_pairs()
    |> get_round_results_part_2()
    |> Enum.sum()
  end

  def input_to_pairs() do
    File.read!("input.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x) end)
  end

  def get_round_results_part_1(input_pairs) do
    Enum.map(input_pairs, &calculate_round_score/1)
  end

  def get_round_results_part_2(input_pairs) do
    Enum.map(input_pairs, &calculate_shape/1)
  end

  def calculate_round_score(matchup_pair) do
    win = 6
    draw = 3
    lose = 0

    case matchup_pair do
      [@elf_rock, @rock] -> 1 + draw
      [@elf_rock, @paper] -> 2 + win
      [@elf_rock, @scissors] -> 3 + lose
      [@elf_paper, @rock] -> 1 + lose
      [@elf_paper, @paper] -> 2 + draw
      [@elf_paper, @scissors] -> 3 + win
      [@elf_scissors, @rock] -> 1 + win
      [@elf_scissors, @paper] -> 2 + lose
      [@elf_scissors, @scissors] -> 3 + draw
      _ -> :error
    end
  end

  def calculate_shape(matchup_pair) do
    rock = 1
    paper = 2
    scissors = 3

    win = 6
    draw = 3
    lose = 0

    case matchup_pair do
      [@elf_rock, @lose] -> lose + scissors
      [@elf_rock, @draw] -> draw + rock
      [@elf_rock, @win] -> win + paper
      [@elf_paper, @lose] -> lose + rock
      [@elf_paper, @draw] -> draw + paper
      [@elf_paper, @win] -> win + scissors
      [@elf_scissors, @lose] -> lose + paper
      [@elf_scissors, @draw] -> draw + scissors
      [@elf_scissors, @win] -> win + rock
      _ -> :error
    end
  end
end
