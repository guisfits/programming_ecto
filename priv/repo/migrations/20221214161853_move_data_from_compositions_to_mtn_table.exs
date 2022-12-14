defmodule MusicDB.Repo.Migrations.MoveDataFromCompositionsToMtnTable do
  use Ecto.Migration

  import Ecto.Query
  alias MusicDB.Repo

  def up do
    from(c in "compositions", select: [:id, :artist_id])
    |> Repo.all()
    |> Enum.each(fn row ->
      Repo.insert_all("compositions_artists", [
        [composition_id: row.id, artist_id: row.artist_id, role: "composer"]
      ])
    end)
  end

  def down do
    query =
      from ca in "compositions_artists",
      where: ca.role == "composer",
      select: [:composition_id, :artist_id]

    query
    |> Repo.all()
    |> Enum.each(fn row ->
      Repo.update_all(
        from(c in "compositions", where: c.id == ^row.composition_id),
        set: [artist_id: row.artist_id]
      )
    end)
  end
end
