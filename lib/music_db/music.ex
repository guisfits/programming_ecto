defmodule MusicDb.Music do
  alias MusicDB.{Repo, Album, Artist}

  def get_artist(name) do
    Repo.get_by(Artist, name: name)
  end

  def all_albums_by_artist(artist) do
    Ecto.assoc(artist, :albums)
    |> MusicDB.Repo.all()
  end

  def search_albums(search) do
    search
    |> Album.search()
    |> Repo.all()
  end
end
