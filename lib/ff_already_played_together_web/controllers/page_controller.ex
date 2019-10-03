defmodule FfAlreadyPlayedTogetherWeb.PageController do
  use FfAlreadyPlayedTogetherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
