priorities =
  ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  |> Enum.with_index(1)
  |> Enum.reduce(%{}, fn {letter, prio}, memo -> memo |> Map.put(letter, prio) end)

File.read!("3_input.txt")
|> String.trim
|> String.split("\n")
|> Enum.reduce(0, fn items, priority_sum ->
  middle_index = String.length(items) |> div(2)
  first_compartment = 
    items
    |> String.slice(0, middle_index)
    |> String.graphemes
    |> MapSet.new
  second_compartment =
    items
    |> String.slice(middle_index, String.length(items))
    |> String.graphemes
    |> MapSet.new

  [duplicated_item] =
    MapSet.intersection(first_compartment, second_compartment) |> MapSet.to_list

  priority_sum + Map.get(priorities, duplicated_item)
end)
|> IO.inspect
