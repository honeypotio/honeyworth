defmodule Honeyworth.PageController do
  use Honeyworth.Web, :controller

  def legal_notice(conn, _params) do
    render conn, "legal_notice.html"
  end
end
