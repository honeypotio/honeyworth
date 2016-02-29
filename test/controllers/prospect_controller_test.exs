defmodule Honeyworth.ProspectControllerTest do
  use Honeyworth.ConnCase

  alias Honeyworth.Prospect
  @valid_attrs %{dev_link: "some content", email: "Qwiggle@honeypot.co", profile_link: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, prospect_path(conn, :new)
    assert html_response(conn, 200) =~ "What's in the pot for you?"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, prospect_path(conn, :create), prospect: @valid_attrs
    assert redirected_to(conn) == prospect_path(conn, :new)
    assert Repo.get_by(Prospect, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, prospect_path(conn, :create), prospect: @invalid_attrs
    assert html_response(conn, 200) =~ "Oops, something went wrong! Please check the errors below"
  end

  test "addition of utm_source from cookies" do
    conn = get conn, "/?utm_source=mickey_mouse_comic"
    conn = post conn, prospect_path(conn, :create), prospect: @valid_attrs
    assert redirected_to(conn) == prospect_path(conn, :new)
    assert "mickey_mouse_comic" == Repo.get_by(Prospect, @valid_attrs).source
  end
end
