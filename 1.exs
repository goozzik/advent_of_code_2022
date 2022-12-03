File.read!("1_input.txt")
|> String.split("\n\n")
|> Enum.map(fn food ->
  food
  |> String.trim
  |> String.split("\n")
  |> Enum.reduce(0, fn cals, memo -> memo + String.to_integer(cals) end)
end)
|> Enum.with_index
|> Enum.reduce({0, 0}, fn {cals, index}, {max_index, max_cals} ->
  if cals > max_cals,
    do: {index, cals},
    else: {max_index, max_cals}
end)
