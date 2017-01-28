defmodule Discuss.TopicControllerTest do
  use Discuss.ConnCase

  alias Discuss.{Repo,Topic}

  test "GET /", %{conn: conn} do
    changeset = Topic.changeset(%Topic{}, %{title: "I am a title"})
    Repo.insert(changeset)

    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Topics"
    assert html_response(conn, 200) =~ "I am a title"
  end
end
