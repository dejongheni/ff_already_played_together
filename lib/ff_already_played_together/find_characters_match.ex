defmodule FfAlreadyPlayedTogether.FindCharactersMatch do
  import FfAlreadyPlayedTogether.FindCharacter
  use Memoize

  def get_parses_in_common(name1, server1, region1, name2, server2, region2) do
    player1 = get_character_reports_id_and_fights(name1, server1, region1)
    player2 = get_character_reports_id_and_fights(name2, server2, region2)
    not_in_common = player1 -- player2
    player1 -- not_in_common
  end

  def parses_into_links(parses) do
    Enum.map(parses, fn parse ->
      "https://www.fflogs.com/reports/#{parse["reportID"]}#fight=#{parse["fightID"]}"
    end)
  end

  def get_parses(name1, server1, region1, name2, server2, region2) do
    get_parses_in_common(name1, server1, region1, name2, server2, region2)
    |> parses_into_links
  end
end
