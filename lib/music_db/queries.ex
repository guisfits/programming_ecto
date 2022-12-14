defmodule MusicDb.Queries do
  import Ecto.Query
  import MusicDB.Repo

  def using_macro do
    query =
      from a in "artists",
      where: lower(a.name) == "miles davis",
      select: [:id, :name]

    all(query)
  end
end
