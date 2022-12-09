chars =
  "6_input.txt"
  |> File.read!
  |> String.graphemes

find_position =
  fn chars, uniq_chars_lenght ->
    first_index = 
      chars
      |> Enum.with_index
      |> Enum.find(fn {_char, index} ->
        len =
          chars
          |> Enum.slice(index, uniq_chars_lenght)
          |> Enum.uniq
          |> length

        len == uniq_chars_lenght
      end)
      |> elem(1)
    first_index + uniq_chars_lenght
  end

# part 1
find_position.(chars, 4) |> IO.inspect()
# part 2
find_position.(chars, 14) |> IO.inspect()


