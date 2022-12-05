# part 1
File.read!("4_input.txt")
|> String.trim
|> String.split("\n")
|> Enum.reduce(0, fn sections, memo ->
  [elv_1_section_start, elv_1_section_end, elv_2_section_start, elv_2_section_end] =
    sections
    |> String.split(",")
    |> Enum.flat_map(fn elv_section_range ->
      elv_section_range
      |> String.split("-")
      |> Enum.map(&String.to_integer/1)
    end)

  if (elv_1_section_start <= elv_2_section_start && elv_1_section_end >= elv_2_section_end) ||
    (elv_2_section_start <= elv_1_section_start && elv_2_section_end >= elv_1_section_end) do
    memo + 1
  else
    memo
  end
end)
|> IO.inspect

# part 2
File.read!("4_input.txt")
|> String.trim
|> String.split("\n")
|> Enum.reduce(0, fn sections, memo ->
  [elv_1_section_start, elv_1_section_end, elv_2_section_start, elv_2_section_end] =
    sections
    |> String.split(",")
    |> Enum.flat_map(fn elv_section_range ->
      elv_section_range
      |> String.split("-")
      |> Enum.map(&String.to_integer/1)
    end)

  if (elv_1_section_start <= elv_2_section_start && elv_1_section_end >= elv_2_section_start) ||
    (elv_2_section_start <= elv_1_section_start && elv_2_section_end >= elv_1_section_start) do
    memo + 1
  else
    memo
  end
end)
|> IO.inspect
