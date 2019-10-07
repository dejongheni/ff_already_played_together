defmodule FfAlreadyPlayedTogetherWeb.CharactersLive do
  use Phoenix.LiveView
  alias FfAlreadyPlayedTogetherWeb.CharactersView
  alias FfAlreadyPlayedTogether.FindCharactersMatch

  def mount(_session, socket) do
    {:ok, assign(socket, player1: "", player2: "", result: {:ok, []},servers_list: Application.get_env(:ff_already_played_together, :servers_list))}
  end

  def render(assigns) do
    CharactersView.render("characters.html", assigns)
  end

  def handle_event("search", %{"player1" => player1, "player2" => player2, "select-server-player1" => player1_server, "select-server-player2" => player2_server}, socket) do
    if player1 == "" or player2 == "" do
      {:noreply, assign(socket, player1: player1, player2: player2, result: {:error, ["Please input a character name"]})}
    else
      [player1_server, player1_region] = String.split(player1_server, "-")
      [player2_server, player2_region] = String.split(player2_server, "-")
      result = FindCharactersMatch.get_parses(player1, player1_server, player1_region, player2, player2_server, player2_region)
      {:noreply, assign(socket, player1: player1, player2: player2, result: result)}
    end
  end
end
