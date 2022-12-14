defmodule MusicDB.Repo.Migrations.AddCompositionsIndex do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    create index("compositions", :title, concurrently: true)
  end
end
