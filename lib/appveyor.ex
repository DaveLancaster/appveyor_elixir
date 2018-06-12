defmodule Appveyor do
  def add_project(%NewProject{} = project) do
    Api.post!("/projects/", project)
  end

  def environments do
    Appveyor.Endpoints.environments
      |> Api.fetch()
      |> Poison.decode!(as: [%Environment{}])
  end
  
  def projects do
    Appveyor.Endpoints.projects
      |> Api.fetch()
      |> Poison.decode!(as: [%Project{}])
  end

  def last_build(account_name, project_slug) do
    Appveyor.Endpoints.projects
      |> Enum.join(account_name)
      |> Enum.join("/" <> project_slug)
      |> Api.fetch()
      |> Poison.decode!(as: %{"project" => %Project{}, "build" => %Build{}})
  end
end
