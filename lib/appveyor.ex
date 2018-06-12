defmodule Appveyor do
  def add_project(%NewProject{} = project) do
    Api.post!("/projects/", project)
  end

  def environments do
    "/environments"
      |> Api.fetch()
      |> Poison.decode!(as: [%Environment{}])
  end
  
  def projects do
    "/projects"
      |> Api.fetch()
      |> Poison.decode!(as: [%Project{}])
  end

  def last_build(account_name, project_slug) do
    "/projects/" <> account_name <> "/" <> project_slug
      |> Api.fetch()
      |> Poison.decode!(as: %{"project" => %Project{}, "build" => %Build{}})
  end
end
