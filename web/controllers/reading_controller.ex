defmodule StoryTime.ReadingController do
  use StoryTime.Web, :controller

  alias StoryTime.Reading

  def index(conn, _params) do
    readings = Repo.all(Reading)
    render(conn, "index.html", readings: readings)
  end

  def new(conn, _params) do
    changeset = Reading.changeset(%Reading{})
    books = Repo.all(StoryTime.Book)
    render(conn, "new.html", changeset: changeset, books: books)
  end

  def create(conn, %{"reading" => reading_params}) do
    changeset = Reading.changeset(%Reading{}, reading_params)

    case Repo.insert(changeset) do
      {:ok, _reading} ->
        conn
        |> put_flash(:info, "Reading created successfully.")
        |> redirect(to: reading_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reading = Repo.get!(Reading, id)
    render(conn, "show.html", reading: reading)
  end

  def edit(conn, %{"id" => id}) do
    reading = Repo.get!(Reading, id)
    changeset = Reading.changeset(reading)
    render(conn, "edit.html", reading: reading, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reading" => reading_params}) do
    reading = Repo.get!(Reading, id)
    changeset = Reading.changeset(reading, reading_params)

    case Repo.update(changeset) do
      {:ok, reading} ->
        conn
        |> put_flash(:info, "Reading updated successfully.")
        |> redirect(to: reading_path(conn, :show, reading))
      {:error, changeset} ->
        render(conn, "edit.html", reading: reading, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reading = Repo.get!(Reading, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(reading)

    conn
    |> put_flash(:info, "Reading deleted successfully.")
    |> redirect(to: reading_path(conn, :index))
  end
end
