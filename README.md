# Programming Ecto

Code from the book _Programming Ecto_

## Postgres

`docker volume create programming_ecto`

`docker run --rm -e "POSTGRES_PASSWORD=postgres" -e "POSTGRES_USER=postgres" -e "POSTGRES_DB=music_db" -p 5432:5432 -v programming_ecto:/var/lib/postgresql/data -d postgres`
