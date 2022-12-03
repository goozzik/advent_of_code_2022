# part 1

sorted_by_cals =
  File.read!("1_input.txt")
  |> String.split("\n\n")
  |> Enum.map(fn food ->
    food
    |> String.trim
    |> String.split("\n")
    |> Enum.reduce(0, fn cals, memo -> memo + String.to_integer(cals) end)
  end)
  |> Enum.with_index
  |> Enum.sort_by(fn {cals, index} -> cals end)
  |> Enum.reverse

sorted_by_cals
|> Enum.at(0)
|> elem(0)
|> IO.inspect

# part 2

sorted_by_cals
|> Enum.take(3)
|> Enum.reduce(0, fn {cals, _}, memo -> memo + cals end)
|> IO.inspect

