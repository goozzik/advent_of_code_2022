chars =
  "6_input.txt"
  |> File.read!
  # "bvwbjplbgvbhsrlpgdmjqwftvncz"
  |> String.graphemes
# require IEx; IEx.pry()

first_index = 
  chars
  |> Enum.with_index
  |> Enum.find(fn {_char, index} ->
    len =
      chars
      |> Enum.slice(index, 4)
      |> IO.inspect
      |> Enum.uniq
      |> length

    len == 4
  end)
  |> elem(1)

# part 1
IO.inspect(first_index + 4)


