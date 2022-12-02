defmodule Y2022.Day02 do
  @rock "X"
  @paper "Y"
  @scissors "Z"

  @elf_rock "A"
  @elf_paper "B"
  @elf_scissors "C"

  def run_part_1_game() do
    input_to_pairs()
    |> get_round_results()
    |> Enum.sum()
  end

  def input_to_pairs() do
    File.read!("input.txt")
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x) end)
  end

  def get_round_results(input_pairs) do
    Enum.map(input_pairs, &calculate_round_score/1)
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

  # File.read!("input.txt")
  # |> String.split("\n")
  # |> Enum.map(fn x -> String.split(x) end)
  # |> Enum.map(&calculate_round_score/1)
end
