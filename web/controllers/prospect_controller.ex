defmodule Honeyworth.ProspectController do
  use Honeyworth.Web, :controller

  alias Honeyworth.Prospect

  plug :scrub_params, "prospect" when action in [:create]

  def new(conn, _params) do
    changeset = Prospect.changeset(%Prospect{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"prospect" => prospect_params}) do
    changeset = Prospect.changeset(%Prospect{}, prospect_params)

    case Repo.insert(changeset) do
      {:ok, _prospect} ->
        conn
        |> put_flash(:info, "Thank you! We received your profile and will get back to you with your salary report within 72 hours via email.")
        |> redirect(to: prospect_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
