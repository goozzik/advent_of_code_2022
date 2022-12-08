input_file_name = "5_input.txt"
#input_file_name = "5_example.txt"

[crate_matrix, rearragment_steps] = 
  File.read!(input_file_name)
  |> String.split("\n\n")

crate_matrix = 
  crate_matrix
  |> String.split("\n")
  |> Enum.drop(-1)
  |> Enum.reduce(%{}, fn row, memo -> 
    row
    |> Stream.unfold(&String.split_at(&1, 4))
    |> Enum.take_while(&(&1 != ""))
    |> Enum.with_index(1)
    |> Enum.reduce(memo, fn {crate, stack_index}, memo ->
      case crate |> String.trim do
        "" -> memo
        crate ->
          case memo |> Map.get(stack_index) do
            nil -> memo |> Map.put(stack_index, [crate])
            stack -> memo |> Map.put(stack_index, [crate | stack])
          end
      end
    end)
  end)

rearrange =
  fn crate_matrix, rearragment_steps, move_multiple_crates ->
    rearragment_steps
    |> String.split("\n")
    |> Enum.reverse
    |> Enum.drop(1)
    |> Enum.reverse
    |> Enum.reduce(crate_matrix, fn rearragment_step, memo ->
      [_, count, _, from, _, to] = rearragment_step |> String.split("\n") |> List.first |> String.split(" ")
      move = count |> String.to_integer
      from = from |> String.to_integer
      to = to |> String.to_integer

      {crates_left, crates_to_move} = memo[from] |> Enum.split(-(move))

      to_crates = 
        if move_multiple_crates,
          do: Map.get(memo, to) ++ crates_to_move,
          else: Map.get(memo, to) ++ Enum.reverse(crates_to_move)

      memo
      |> Map.put(from, crates_left)
      |> Map.put(to, to_crates)
    end)
    |> Map.values
    |> Enum.map(& List.last(&1))
    |> Enum.map(& String.at(&1, 1))
    |> Enum.join
  end

# part 1
rearrange.(crate_matrix, rearragment_steps, false) |> IO.inspect

# part 2
rearrange.(crate_matrix, rearragment_steps, true) |> IO.inspect
