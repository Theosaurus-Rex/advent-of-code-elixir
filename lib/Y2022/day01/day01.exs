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

  Enum.max(totaled_calories)
  |> IO.inspect()
end
