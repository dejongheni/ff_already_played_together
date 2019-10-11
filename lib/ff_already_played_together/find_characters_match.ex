defmodule FfAlreadyPlayedTogether.FindCharactersMatch do
  import FfAlreadyPlayedTogether.FindCharacter
  use Memoize

  def get_parses_in_common(name1, server1, region1, name2, server2, region2, params \\ %{}) do
    case get_character_reports_id_and_fights(name1, server1, region1, params) do
      {:ok, player1} ->
        case get_character_reports_id_and_fights(name2, server2, region2, params) do
          {:ok, player2} ->
            [player1_grouped, player2_grouped] =
              [player1, player2]
              |> Enum.map(fn list -> Enum.group_by(list, & {&1["reportID"], &1["fightID"]}) end)
            not_common = MapSet.difference(MapSet.new(player1_grouped |> Map.keys), MapSet.new(player2_grouped |> Map.keys))
            common = MapSet.difference(MapSet.new(player1_grouped |> Map.keys), not_common)
              |> MapSet.to_list
              |> Enum.flat_map(fn tt -> player1_grouped[tt] end)

            {:ok, common}
          {:error, error} -> {:error, error}
        end
      {:error, error} -> {:error, error}
    end
  end

  def parses_into_links(parses) do
    Enum.map(parses, fn parse ->
      "https://www.fflogs.com/reports/#{parse["reportID"]}#fight=#{parse["fightID"]}"
    end)
  end

  def get_parses(name1, server1, region1, name2, server2, region2, params \\ %{}) do
    case get_parses_in_common(name1, server1, region1, name2, server2, region2, params) do
      {:ok, parses} -> {:ok, parses_into_links(parses)}
      {:error, error} -> {:error, [error]}
    end
  end
end
