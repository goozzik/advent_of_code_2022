# part 1
player_1_shape_by_letter = %{"A" => :rock, "B" => :paper, "C" => :scissors}
player_2_shape_by_letter = %{"X" => :rock, "Y" => :paper, "Z" => :scissors}

points_by_round_outcome = %{lose: 0, draw: 3, win: 6}
points_by_shape = %{rock: 1, paper: 2, scissors: 3}

rounds = 
  File.read!("2_input.txt")
  |> String.trim
  |> String.split("\n")

rounds
|> Enum.reduce(0, fn shapes, score ->
  [player_1_letter, player_2_letter] = shapes |> String.split(" ")

  player_1_shape = player_1_shape_by_letter |> Map.get(player_1_letter)
  player_2_shape = player_2_shape_by_letter |> Map.get(player_2_letter)

  player_2_outcome =
    case {player_1_shape, player_2_shape} do
      {:rock, :paper} -> :win
      {:rock, :scissors} -> :lose 
      {:paper, :rock} -> :lose
      {:paper, :scissors} -> :win
      {:scissors, :rock} -> :win
      {:scissors, :paper} -> :lose
      _ -> :draw
    end

  score +
    Map.get(points_by_round_outcome, player_2_outcome) +
    Map.get(points_by_shape, player_2_shape)
end)
|> IO.inspect

# part 2

outcome_by_letter = %{"X" => :lose, "Y" => :draw, "Z" => :win}

rounds
|> Enum.reduce(0, fn round_letters, score ->
  [player_1_letter, outcome_letter] = round_letters |> String.split(" ")

  player_1_shape = player_1_shape_by_letter |> Map.get(player_1_letter)
  player_2_outcome = outcome_by_letter |> Map.get(outcome_letter)

  player_2_shape =
    case {player_1_shape, player_2_outcome} do
      {:rock, :win} -> :paper
      {:rock, :lose} -> :scissors
      {:paper, :win} -> :scissors
      {:paper, :lose} -> :rock
      {:scissors, :win} -> :rock
      {:scissors, :lose} -> :paper
      _ -> player_1_shape
    end

    score +
      Map.get(points_by_round_outcome, player_2_outcome) +
      Map.get(points_by_shape, player_2_shape)
end)
|> IO.inspect
