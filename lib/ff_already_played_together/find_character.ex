defmodule FfAlreadyPlayedTogether.FindCharacter do
  import FflogsWrapper.Parses
  use Memoize


  defmemo get_character_reports_id_and_fights(name, server, region), expires_in: 12 * 60 * 60 * 1000  do
    name = String.replace(name, " ", "%20")

    get_character_parses(name, server, region)
    |> Enum.map(fn report -> %{"reportID" => report["reportID"], "fightID" => report["fightID"]} end)
  end

  defmemo get_zones_list(), expires_in: 24 * 60 * 60 * 1000  do
    FflogsWrapper.Zones.get_zones
    |> Enum.map(fn zone -> %{"id" => zone["id"], "partitions" => count_partitions(zone["partitions"])} end)
  end

  defp count_partitions(nil) do
    0
  end

  defp count_partitions(partitions) do
    Enum.count(partitions)
  end
end
