defmodule MusicDB.Repo.Migrations.RemoveArtistIdFromCompositions do
  use Ecto.Migration

  def change do
    alter table("compositions") do
      remove :artist_id
    end
  end
end
