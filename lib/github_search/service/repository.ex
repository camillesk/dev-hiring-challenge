defmodule GithubSearch.Service.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  alias GithubSearch.Service.Search

  schema "repositories" do
    field :description, :string
    field :forks, :integer
    field :language, :string
    field :name, :string
    field :url, :string
    field :watchers, :integer

    belongs_to :search, Search

    timestamps()
  end

  @doc false
  def changeset(repository, attrs) do
    repository
    |> cast(attrs, [:name, :description, :url, :forks, :watchers, :language])
    |> validate_required([:name, :description, :url, :forks, :watchers, :language])
  end
end
