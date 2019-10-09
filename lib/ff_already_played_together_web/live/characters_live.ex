defmodule FfAlreadyPlayedTogetherWeb.CharactersLive do
  use Phoenix.LiveView
  alias FfAlreadyPlayedTogetherWeb.CharactersView
  alias FfAlreadyPlayedTogether.FindCharactersMatch
  alias FfAlreadyPlayedTogether.FindCharacter

  @servers_list Application.get_env(:ff_already_played_together, :servers_list)
  @default_selected Application.get_env(:ff_already_played_together, :default_tier_id)

  def mount(_session, socket) do
    zones = FindCharacter.get_zones
    {:ok, assign(socket, %{
      zones: zones,
      selected: @default_selected,
      player1: "",
      player2: "",
      result: {:ok, []},
      servers_list: @servers_list
     }
     )
    }
  end

  def render(assigns) do
    CharactersView.render("characters.html", assigns)
  end

  def handle_event("search", %{"partition_selected" => partition, "selected" => selected, "player1" => player1, "player2" => player2, "select-server-player1" => player1_server, "select-server-player2" => player2_server}, socket) do
    if player1 == "" or player2 == "" do
      {:noreply, assign(socket, player1: player1, player2: player2, result: {:error, ["Please input a character name"]})}
    else
      [player1_server, player1_region] = String.split(player1_server, "-")
      [player2_server, player2_region] = String.split(player2_server, "-")

      result = FindCharactersMatch.get_parses(player1, player1_server, player1_region, player2, player2_server, player2_region, %{zone: selected, partition: partition})

      {:noreply, assign(socket, player1: player1, player2: player2, result: result)}
    end
  end

  def handle_event("select_zone", %{"value" => value}, socket) do
    {:noreply, assign(socket, selected: String.to_integer(value))}
  end
end
