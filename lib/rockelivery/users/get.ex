defmodule Rockelivery.Users.Get do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User, Error}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> Error.build_id_format_error()
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> Error.build_user_not_found()
      user -> {:ok, user}
    end
  end
end