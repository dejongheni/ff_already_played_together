defmodule FfAlreadyPlayedTogether.FindCharacter do
  import FflogsWrapper.Parses
  use Memoize


  defmemo get_character_reports_id_and_fights(name, server, region, params), expires_in: 12 * 60 * 60 * 1000  do
    name = String.replace(name, " ", "%20")

    parses = get_character_parses(name, server, region, params)
    if is_map(parses) && Map.has_key?(parses, "error") do
      {:error, parses["error"]}
    else
      result = Enum.map(parses, fn report -> %{"reportID" => report["reportID"], "fightID" => report["fightID"]} end)
      {:ok, result}
    end
  end

  defmemo get_zones(), expires_in: 24 * 60 * 60 * 1000  do
    FflogsWrapper.Zones.get_zones
    |> Enum.map(fn zone ->
      %{"id" => zone["id"],
        "name" => zone["name"],
        "partitions" => if Map.has_key?(zone, "partitions") do Enum.uniq_by(zone["partitions"], fn partition -> partition["name"] end) else %{} end
       }
      end)
  end
end
