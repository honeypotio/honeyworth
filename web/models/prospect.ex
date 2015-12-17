defmodule Honeyworth.Prospect do
  use Honeyworth.Web, :model

  schema "prospects" do
    field :name, :string
    field :email, :string
    field :profile_link, :string
    field :dev_link, :string

    timestamps
  end

  @required_fields ~w(email profile_link dev_link)
  @optional_fields ~w(name)
  @email_regexp ~r/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, @email_regexp)
  end
end
