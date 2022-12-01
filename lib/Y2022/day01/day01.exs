defmodule Y2022.Day01 do
  split_ration_inventories =
    File.read!("input.txt")
    |> String.split("\n\n")
    |> Enum.map(fn x -> String.split(x) end)

  totaled_calories =
    for elf <- split_ration_inventories do
      Enum.map(elf, fn calorie_amount -> String.to_integer(calorie_amount) end)
      |> Enum.sum()
    end

  _part_1 = Enum.max(totaled_calories)
  [one, two, three | _tail] = Enum.sort(totaled_calories, :desc)
  _part_2 = one + two + three
end
