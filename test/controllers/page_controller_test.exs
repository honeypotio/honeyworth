defmodule Honeyworth.PageControllerTest do
  use Honeyworth.ConnCase

  test "GET /pages/legal_notice" do
    conn = get conn(), "/pages/legal_notice"
    assert html_response(conn, 200) =~ "Legal Notice"
  end
end
