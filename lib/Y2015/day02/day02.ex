defmodule Y2015.Day02 do
  def parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_number_list/1)
  end

  def parse_number_list(list) do
    list
    |> String.split("x")
    |> Enum.map(&String.to_integer/1)
  end

  def wrapping_paper(l, w, h) do
    surface_area = 2 * l * w + 2 * w * h + 2 * h * l
    [smallest, second_smallest, _] = Enum.sort([l, w, h])
    slack = smallest * second_smallest
    surface_area + slack
  end

  def total_wrapping_paper(boxes) do
    paper_dimensions =
      for [l, w, h] <- boxes do
        wrapping_paper(l, w, h)
      end

    Enum.sum(paper_dimensions)
  end

  def ribbon_needed([l, w, h]) do
    wrap_ribbon = 2 * (l + w + h - hd(Enum.sort([l, w, h], :desc)))

    bow_ribbon = l * w * h

    wrap_ribbon + bow_ribbon
  end

  def total_ribbon(input) do
    ribbon =
      for box <- input do
        ribbon_needed(box)
      end

    Enum.sum(ribbon)
  end

  def part_1 do
    File.read!("input.txt")
    |> parse_input()
    |> total_wrapping_paper()
  end

  def part_2 do
    File.read!("input.txt")
    |> parse_input()
    |> total_ribbon()
  end
end
