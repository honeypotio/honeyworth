defmodule Honeyworth.ProspectTest do
  use Honeyworth.ModelCase

  alias Honeyworth.Prospect

  @valid_attrs %{dev_link: "some content", email: "some content", name: "some content", profile_link: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Prospect.changeset(%Prospect{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset without name attribute" do
    changeset = Prospect.changeset(%Prospect{}, Dict.delete(@valid_attrs, :name))
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Prospect.changeset(%Prospect{}, @invalid_attrs)
    refute changeset.valid?
  end
end
